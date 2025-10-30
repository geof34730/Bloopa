// lib/seo/seo_observer.dart
import 'package:flutter/material.dart';
import 'meta_manager.dart';

/// Données SEO par page
class SeoData {
  final String? title;
  final String? description;
  final String? canonicalUrl;
  // Ajoute d'autres champs si tu veux (ogImage, jsonLd, etc.)

  const SeoData({this.title, this.description, this.canonicalUrl});

  /// Construit depuis une Map (pratique avec `extra` ou `arguments`)
  factory SeoData.fromMap(Map data) => SeoData(
    title: data['title'] as String?,
    description: data['description'] as String?,
    canonicalUrl: data['url'] as String? ?? data['canonical'] as String?,
  );
}

/// Observer qui applique les balises à chaque navigation
class SeoObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route<dynamic>? previousRoute) {
    _updateFrom(route);
    super.didPush(route, previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (newRoute != null) _updateFrom(newRoute);
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didPop(Route route, Route<dynamic>? previousRoute) {
    if (previousRoute != null) _updateFrom(previousRoute);
    super.didPop(route, previousRoute);
  }

  void _updateFrom(Route route) {
    final settings = route.settings;

    // 1) Si on nous a fourni un objet SeoData directement
    if (settings.arguments is SeoData) {
      _apply(settings.arguments as SeoData);
      return;
    }

    // 2) Si on nous a fourni une Map (ex: via GoRouter state.extra/arguments)
    if (settings.arguments is Map) {
      _apply(SeoData.fromMap(settings.arguments as Map));
      return;
    }

    // 3) Fallback léger : titre depuis le nom/chemin
    final routeName = settings.name;
    if (routeName != null && routeName.isNotEmpty) {
      MetaManager.setTitle(_titleFromRouteName(routeName));
    }
  }

  void _apply(SeoData data) {
    if (data.title != null && data.title!.isNotEmpty) {
      MetaManager.setTitle(data.title!);
    }
    if (data.description != null && data.description!.isNotEmpty) {
      MetaManager.setDescription(data.description!);
    }
    if (data.canonicalUrl != null && data.canonicalUrl!.isNotEmpty) {
      MetaManager.setCanonical(data.canonicalUrl!);
    }

    // Si tu ajoutes plus tard MetaManager.setOpenGraph / setJsonLd,
    // tu pourras les appeler ici en étendant SeoData.
  }

  String _titleFromRouteName(String name) {
    // Transforme "liste-produit/:categorie/:type" → "Liste produit – Bloopa"
    final cleaned = name.replaceAll(RegExp(r'[:/#]'), ' ').trim();
    final titled = cleaned.isEmpty ? 'Bloopa' : '${_capitalize(cleaned)} – Bloopa';
    return titled;
  }

  String _capitalize(String s) =>
      s.split(RegExp(r'\s+')).map((w) => w.isEmpty ? w : '${w[0].toUpperCase()}${w.substring(1)}').join(' ');
}
