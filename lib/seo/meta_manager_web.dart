import 'dart:html' as html;

class MetaManager {
  static void setTitle(String title) => html.document.title = title;

  static void setDescription(String description) {
    _upsertMeta(name: 'description', content: description);
  }

  static void setCanonical(String url) {
    final existing = html.document.head!.querySelector('link[rel="canonical"]');
    if (existing != null) {
      existing.setAttribute('href', url);
      return;
    }
    final link = html.LinkElement()
      ..rel = 'canonical'
      ..href = url;
    html.document.head!.append(link);
  }

  static void _upsertMeta({required String name, required String content}) {
    final selector = 'meta[name="$name"]';
    final el = html.document.head!.querySelector(selector);
    if (el != null) {
      el.setAttribute('content', content);
      return;
    }
    final meta = html.MetaElement()
      ..name = name
      ..content = content;
    html.document.head!.append(meta);
  }
}
