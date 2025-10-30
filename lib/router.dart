// lib/router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'global.dart';
import 'seo/seo_observer.dart'; // contient SeoData et l'observer
import 'ui/screens/home.dart';
import 'ui/screens/ProductList.dart';

final GoRouter router = GoRouter(
  observers: [SeoObserver()], // ⬅️ applique le SEO à chaque nav
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        final seo =  SeoData(
          title: 'Accueil | Bloopa',
          description: 'Catalogue de produits Bloopa : catégories, nouveautés et meilleures offres.',
          canonicalUrl: '$urlWebApp/',
        );
        return MaterialPage<void>(
          key: state.pageKey,
          name: state.fullPath,
          arguments: seo, // ⬅️ SeoData centralisé ici
          child: const HomeScreen(),
        );
      },
      routes: [
        GoRoute(
          path: ':categorie/:typeproduit',
          pageBuilder: (context, state) {
            final categorie   = state.pathParameters['categorie']!;
            final typeProduit = state.pathParameters['typeproduit']!;

            final seo = SeoData(
              title: '$typeProduit - $categorie | Bloopa',
              description: 'Découvrez nos $typeProduit dans la catégorie $categorie – prix, photos, livraison.',
              canonicalUrl: '$urlWebApp/liste-produit/$categorie/$typeProduit',
            );

            return MaterialPage<void>(
              key: state.pageKey,
              name: state.fullPath,
              arguments: seo, // ⬅️ SeoData pour cette page
              child: ProductListScreen(
                categorie: categorie,
                typeproduit: typeProduit,
              ),
            );
          },
        ),
      ],
    ),
  ],
);
