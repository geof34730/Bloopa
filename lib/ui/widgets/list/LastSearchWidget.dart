import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:go_router/go_router.dart';
import '../../themes/bloopaExtras.dart';

class WebDragScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.stylus,
    PointerDeviceKind.unknown,
  };
}

class ListLastSearchWidget extends StatelessWidget {
  const ListLastSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var lastSearches = [
      "Voiture",
      "Télévision",
      "Télévision",
      "Télévision",
      "Télévision",
      "Télévision",
      "Télévision",
      "Ameublement exterieur de lorem ipsum"
    ];

    if (lastSearches.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Recherches récentes :",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kBloopaPrimary,
          ),
        ),
        const SizedBox(height: 8),

        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: SizedBox(
              height: 100,
              child: ScrollConfiguration(
                behavior: WebDragScrollBehavior(),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: lastSearches.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    final searchTerm = lastSearches[index];

                    return Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        height: 90,
                        width: 260,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: () {
                            GoRouter.of(context).go( '/voiture/audi' );
                          },
                          child: Card(
                            margin: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            searchTerm,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        GestureDetector(
                                          behavior: HitTestBehavior.translucent,
                                          onTap: () {
                                            print("Fermer : $searchTerm");
                                          },
                                          child: const Icon(Icons.close, size: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  const Text(
                                    "Toutes catégories",
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  const SizedBox(height: 2),
                                  Row(
                                    children: const [
                                      Icon(Icons.location_on, size: 14),
                                      SizedBox(width: 2),
                                      Text(
                                        "Autour de moi - 20 km",
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
