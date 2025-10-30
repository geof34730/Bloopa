import 'package:flutter/material.dart';

class CarListingCard extends StatelessWidget {
  const CarListingCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.priceLabel,
    required this.year,
    required this.mileageLabel,
    required this.powertrain,
    required this.transmission,
    required this.location,
    this.isFavorite = false,
    this.onTap,
    this.onFavoriteToggle,
  });

  final String imageUrl;
  final String title; // ex: "Audi q5 2.0 50-tfsi e turbo ..."
  final String priceLabel; // ex: "33 490 €"
  final String year; // ex: "2020"
  final String mileageLabel; // ex: "63 000 km"
  final String powertrain; // ex: "Hybride"
  final String transmission; // ex: "Automatique"
  final String location; // ex: "Montpellier 34070 Croix d'Argent"
  final bool isFavorite;

  final VoidCallback? onTap;
  final VoidCallback? onFavoriteToggle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final radius = BorderRadius.circular(16);

    return Card(
      elevation: 2,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: radius),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image + favoris
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 4 / 3,
                  child: Ink.image(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Material(
                    color: Colors.black.withOpacity(0.35),
                    shape: const CircleBorder(),
                    child: IconButton(
                      onPressed: onFavoriteToggle,
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.redAccent : Colors.white,
                      ),
                      tooltip: isFavorite ? 'Retirer des favoris' : 'Ajouter aux favoris',
                    ),
                  ),
                ),
              ],
            ),

            // Contenu
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Titre sur une ligne
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 6),

                  // Prix + petit indicateur de tendance
                  Row(
                    children: [
                      Text(
                        priceLabel,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.green.shade700,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Icon(Icons.trending_down, size: 18, color: Colors.green.shade700),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Ligne des specs (année, km, énergie, boîte)
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 6,
                    runSpacing: -6,
                    children: [
                      _dotText(context, year),
                      _dotText(context, mileageLabel),
                      _dotText(context, powertrain),
                      _dotText(context, transmission),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Localisation
                  Text(
                    location,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.textTheme.bodySmall?.color?.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Affiche "•" séparateurs comme dans l’annonce
  static Widget _dotText(BuildContext context, String text) {
    final style = Theme.of(context).textTheme.bodyMedium?.copyWith(
      color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.8),
    );
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(text, style: style),
        const SizedBox(width: 2),
        const Text('•'),
      ],
    );
  }
}
