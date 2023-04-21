import 'package:flutter/material.dart';
import '../../../../oss_licenses.dart';
import '../../../../package/bluefang_ui/src/shared/app_colors.dart';
import '../../../../package/bluefang_ui/src/widgets/bluefang_text.dart';

class LicencesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          fit: BoxFit.fitWidth,
          child: BFText.headingFour(
            "Licences",
            fontWeight: FontWeight.bold,
          ),
        ),
        bottomOpacity: 0.0,
        elevation: 0.0,
        shadowColor: Colors.transparent,
        iconTheme: const IconThemeData(color: kcPrimaryColor),
        backgroundColor: kcWhite,
      ),
      backgroundColor: kcWhite,
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: ossLicenses.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: kcMediumGreyColor,
                    offset: Offset(0.0, 0.1),
                    blurRadius: 0.5,
                  ),
                ],
                color: kcLightGreyColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LicenceDetailPage(
                        title: ossLicenses[index].name[0].toUpperCase() +
                            ossLicenses[index].name.substring(1),
                        licence: ossLicenses[index].license!,
                      ),
                    ),
                  );
                },
                //capitalize the first letter of the string
                title: Text(
                  ossLicenses[index].name[0].toUpperCase() +
                      ossLicenses[index].name.substring(1),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kcPrimaryColor,
                  ),
                ),

                subtitle: Text(
                  ossLicenses[index].description,
                  style: const TextStyle(
                    fontSize: 15,
                    color: kcBlack,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

//detail page for the licence
class LicenceDetailPage extends StatelessWidget {
  final String title, licence;
  const LicenceDetailPage({required this.title, required this.licence});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          fit: BoxFit.fitWidth,
          child: BFText.headingFour(
            title,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottomOpacity: 0.0,
        elevation: 0.0,
        shadowColor: Colors.transparent,
        iconTheme: const IconThemeData(color: kcPrimaryColor),
        backgroundColor: kcWhite,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(8)),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Text(
                  licence,
                  style: const TextStyle(
                    fontSize: 15,
                    color: kcBlack,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
