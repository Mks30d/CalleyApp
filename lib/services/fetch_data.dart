import 'package:calley_app/models/list_model.dart';
import 'package:calley_app/services/api_service.dart';
import 'package:flutter/material.dart';

class FetchData extends StatefulWidget {
  const FetchData({super.key});

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  ListModel? listModel;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadListData();
  }

  Future<void> _loadListData() async {
    final listData = await ApiService().onFetchListDetails(context);
    setState(() {
      listModel = listData;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (listModel == null) {
      return const Center(child: Text('Failed to load'));
    }

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text("called: ${listModel?.called ?? -1}"),
            Text(
              // "pending: ${listModel?.pending != null ? listModel?.pending : 0}", // or
              "pending: ${listModel?.pending ?? -1}",
            ),
            Text("calls length: ${listModel?.calls?.length ?? -1}"),
            Text("rescheduled: ${listModel?.rescheduled ?? -1}"),
            ElevatedButton(
              onPressed: () {
                _loadListData();
              },
              child: Text("Fetch"),
            ),
          ],
        ),
      ),
    );
  }
}
