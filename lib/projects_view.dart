import 'package:dreamer_app/local_storage.dart';
import 'package:dreamer_app/project_grid_view.dart';
import 'package:dreamer_app/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProjectsView extends StatefulWidget {
  @override
  State<ProjectsView> createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {
  
  @override
  Widget build(BuildContext context) {
    final stateProvider = Provider.of<StateProvider>(context);
    LocalStorage()
        .readProjects()
        .then((value) => {stateProvider.projects = value});

    return (Column(children: [
      // AppBar(),
      Text("All Projects"), // TODO: add tabs for ["All", "Recent", "Starred"]
      Wrap(
        direction: Axis.horizontal,
        clipBehavior: Clip.hardEdge,
        spacing: 30,
        runSpacing: 20,
        children: [
          NewProjectCardView(),
          ...Provider.of<StateProvider>(context)
              .projects
              .map((project) => ProjectGridView(project)),
        ],
      )
    ]));
  }
}