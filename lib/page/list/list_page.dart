
import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart' as dz;
import 'package:demo_users/domain/usecases/get_user_list_usecase.dart';
import 'package:demo_users/framework/router/app_router.dart';
import 'package:flutter/material.dart';

import '../../common/widget/common_widget.dart';
import '../../domain/entities/app_error.dart';
import '../../domain/entities/user_entity.dart';
import '../../framework/locator/inject_container.dart';

@RoutePage()
class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListState();
}

class _ListState extends State<ListPage> {

  final defaultPage = 2;
  final updateItem = 0;
  final deleteItem = 1;
  final defaultUserId = 2;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("List of User"),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem<int>(
                  value: updateItem,
                  child: const Text("Update User 2")
                ),
                PopupMenuItem<int>(
                    value: deleteItem,
                    child: const Text("Delete User 2")
                )
              ];
            },
            onSelected: (value) {
              if (value == updateItem) {
                context.router.push(UpdateRoute(userId: defaultUserId));
              } else if (value == deleteItem) {
                context.router.push(DeleteRoute(userId: defaultUserId));
              }
            },
          )
        ],
      ),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.push(const CreateRoute());
        },
        tooltip: 'Create User',
        child: const Icon(Icons.add),
      ),
    );
  }

  FutureBuilder<dz.Either<AppError, List<UserEntity>?>?> _buildBody(BuildContext context) {
    final getUserListUseCase = locator<GetUserListUseCase>();

    return FutureBuilder<dz.Either<AppError, List<UserEntity>?>>(
      future: getUserListUseCase(defaultPage),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final dz.Either<AppError, List<UserEntity>?>? either = snapshot.data;

          return Column(
            children: <Widget>[
              Expanded(
                child: _buildListView(context, either),
              ),
            ],
          );

        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _buildListView(BuildContext context, dz.Either<AppError, List<UserEntity>?>? either) {
    List<UserEntity>? theEntities;
    String errorMessage = "error fetching data";

    if (either != null) {
      either.fold((appError) {
        errorMessage = appError.message;
      }, (entities) {
        theEntities = entities;
      });
    }

    if (theEntities != null) {
      return ListView.builder(itemBuilder: (context, index) {
        final userEntity = theEntities?[index];

        if (userEntity == null) {
          return emptyWidget();
        }

        return Card(
          child: ListTile(
            title: Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 10, right: 10, bottom: 10),
                    child: userEntity.avatar.isNotEmpty ? Image.network(
                      userEntity.avatar,
                      width: 100,
                      height: 100,
                    ) : emptyWidget(),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(top: 10, right: 10),
                          child: Text(
                            "${userEntity.firstName} ${userEntity.lastName}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 10, right: 10, bottom: 10),
                            child: Text(
                              userEntity.email,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ),
        );
      }, itemCount: theEntities?.length);
    }

    return Text(errorMessage);
  }
}
