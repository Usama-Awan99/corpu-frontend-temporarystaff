import 'package:flutter/material.dart';

class ApprovedApplicationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Approved Applications'),
      ),
      body: Center(
        child: Text('Approved Applications'),
      ),
    );
  }
}

class AllApplicationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Applications'),
      ),
      body: Center(
        child: Text('All Applications'),
      ),
    );
  }
}

class ApplicationsScreen extends StatefulWidget {
  @override
  _ApplicationsScreenState createState() => _ApplicationsScreenState();
}

class _ApplicationsScreenState extends State<ApplicationsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Applications'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Approved'),
            Tab(text: 'All'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ApprovedApplicationsScreen(),
          AllApplicationsScreen(),
        ],
      ),
    );
  }
}
