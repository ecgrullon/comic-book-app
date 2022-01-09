import 'package:comicbook/app/controllers/detail_controller.dart';
import 'package:comicbook/app/models/credit_detail.dart';
import 'package:comicbook/app/models/issue.dart';
import 'package:comicbook/app/widgets/back_button_widget.dart';
import 'package:comicbook/app/widgets/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget _buildImage(Issue issue) {
      double imageH = (400 / 600) * (Get.height * 0.8);

      return Center(
          child: Hero(
        tag: "issue_${issue.id}",
        child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0XFF20202c),
                    spreadRadius: 0,
                    blurRadius: 12,
                    offset: Offset(2, 8),
                  )
                ]),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8), // Image border
                child: Image.network(issue.image!,
                    fit: BoxFit.cover,
                    width: Get.width * 0.8,
                    height: imageH))),
      ));
    }

    Widget _buildListItem(CreditDetail creditDetail) {
      return Row(children: [
        Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0XFF20202c),
                    spreadRadius: 0,
                    blurRadius: 12,
                    offset: Offset(2, 8),
                  )
                ]),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8), // Image border
                child: Stack(
                  children: [
                    Container(color: const Color(0xFF3b3b56), width: 50, height: 50),

                    Image.network(creditDetail.image!,
                        fit: BoxFit.fill, width: 50, height: 50),

                  ],
                ))),
        const SizedBox(width: 12),
        SizedBox(
          width: 110,
          child: Text(
            creditDetail.name ?? 'N/A',
            style: const TextStyle(fontSize: 14),
          ),
        )
      ]);
    }

    Widget _sectionTitle(String title) {
      return Padding(
        padding: const EdgeInsets.only(top:60, bottom: 28),
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      );
    }

    return GetBuilder<DetailController>(
        builder: (_) => Scaffold(
                body: MainPage(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  const Align(
                      alignment: Alignment.topLeft, child: BackButtonWidget()),
                  const SizedBox(height: 30),
                  _buildImage(_.issue.value),
                  const SizedBox(height: 32),
                  Center(
                      child: Text(
                    "${_.issue.value.name ?? 'N/A'} #${_.issue.value.issueNumber}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold),
                  )),
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Center(
                        child: Html(data: _.issue.value.description ?? '')),
                  ),
                  Obx(() => _.characters.isEmpty ? Container() : _sectionTitle("Characters")),
                  Obx(
                    () => _.loading.value
                        ? const Center(child: CircularProgressIndicator())
                        : AlignedGridView.count(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          itemCount: _.characters.length,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 30,
                          itemBuilder: (context, index) =>
                              _buildListItem(_.characters[index])),
                  ),
                  Obx(() => _.teams.isEmpty ? Container() : _sectionTitle("Teams")),
                  Obx(
                    () => _.loading.value
                        ? const Center(child: CircularProgressIndicator())
                        : AlignedGridView.count(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          itemCount: _.teams.length,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 30,
                          itemBuilder: (context, index) =>
                              _buildListItem(_.teams[index])),
                  ),
                  Obx(() => _.locations.isEmpty ? Container() : _sectionTitle("Locations")),
                  Obx(
                    () => _.loading.value
                        ? const Center(child: CircularProgressIndicator())
                        : AlignedGridView.count(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          itemCount: _.locations.length,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 30,
                          itemBuilder: (context, index) =>
                              _buildListItem(_.locations[index])),
                  ),
                  Obx(() => _.concepts.isEmpty ? Container() : _sectionTitle("Concepts")),
                  Obx(
                    () => _.loading.value
                        ? const Center(child: CircularProgressIndicator())
                        : AlignedGridView.count(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          itemCount: _.concepts.length,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 30,
                          itemBuilder: (context, index) =>
                              _buildListItem(_.concepts[index])),
                  )
                ],
              ),
            )));
  }
}
