import 'package:flutter/material.dart';
import 'MenuData.dart';

class MegaMenuLayer extends StatelessWidget {
  final String category;
  final double? maxHeight;   // passé depuis AppBarLarge
  final VoidCallback? onClose;

  const MegaMenuLayer({
    super.key,
    required this.category,
    this.maxHeight,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final data = MegaMenuData.getCategory(category);
    if (data == null) return const SizedBox.shrink();

    final railTitle = (data['railTitle'] ?? category) as String;
    final iconKey   = (data['icon'] ?? '') as String;
    final columns   = (data['columns'] as List).cast<List>();
    final radius    = BorderRadius.circular(14);

    // Corps des colonnes : shrink-wrap par défaut, scroll si maxHeight fourni
    Widget columnsBody = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
      child: LayoutBuilder(
        builder: (context, c) {
          final isTwoCols = c.maxWidth < 640;
          final iterable  = isTwoCols ? columns.take(2).toList() : columns;

          final grid = Wrap(
            spacing: 48,
            runSpacing: 24,
            children: List.generate(iterable.length, (ci) {
              final blocks = iterable[ci] as List;
              return SizedBox(
                width: isTwoCols
                    ? (c.maxWidth - 48) / 2
                    : (c.maxWidth - 96) / 3,
                child: _ColumnBlocks(blocks: blocks),
              );
            }),
          );

          if (maxHeight == null) return grid; // hauteur naturelle
          return ConstrainedBox(
            constraints: BoxConstraints(maxHeight: maxHeight!),
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: grid,
            ),
          );
        },
      ),
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: radius,
        boxShadow: const [
          BoxShadow(
            blurRadius: 24,
            offset: Offset(0, 10),
            color: Color(0x14000000),
          ),
        ],
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width, // ✅ toujours pleine largeur
        // Pas d’IntrinsicHeight ici
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _LeftRail(
              icon: _iconFromKey(iconKey),
              label: railTitle,
              borderRadius: radius,
            ),
            Expanded(child: columnsBody),
          ],
        ),
      ),
    );
  }

  static IconData _iconFromKey(String key) {
    switch (key) {
      case 'car': return Icons.directions_car_outlined;
      case 'toy': return Icons.extension_outlined;
      case 'home': return Icons.home_outlined;
      case 'travel': return Icons.beach_access_outlined;
      case 'work': return Icons.work_outline_rounded;
      case 'fashion': return Icons.checkroom_outlined;
      case 'home2': return Icons.chair_outlined;
      case 'family': return Icons.family_restroom_outlined;
      case 'chip': return Icons.memory_outlined;
      case 'fun': return Icons.sports_esports_outlined;
      case 'dots': return Icons.more_horiz;
      case 'deal': return Icons.local_offer_outlined;
      default: return Icons.apps_rounded;
    }
  }
}

/* ---------- UI bricks ---------- */

class _LeftRail extends StatelessWidget {
  final IconData icon;
  final String label;
  final BorderRadius borderRadius;
  const _LeftRail({required this.icon, required this.label, required this.borderRadius});

  @override
  Widget build(BuildContext context) {
    const Color accent = Color(0xFF0F1A2B);
    return Container(
      width: 230,
      decoration: BoxDecoration(
        color: const Color(0xFFF0F3F7),
        borderRadius: BorderRadius.only(
          topLeft: borderRadius.topLeft,
          bottomLeft: borderRadius.bottomLeft,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      child: Row(
        children: [
          Icon(icon, color: accent),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(
                color: accent,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ColumnBlocks extends StatelessWidget {
  final List blocks; // [{title?, items?, badge?, external?}, ...]
  const _ColumnBlocks({required this.blocks});

  @override
  Widget build(BuildContext context) {
    const Color link = Color(0xFF0F1A2B);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: blocks.map<Widget>((raw) {
        final Map<String, dynamic> b = Map<String, dynamic>.from(raw as Map);
        final String? title = b['title'] as String?;
        final List<String> items =
            (b['items'] as List?)?.map((e) => e.toString()).toList() ?? const [];
        final String? badge = b['badge'] as String?;
        final bool external = (b['external'] as bool?) ?? false;

        final children = <Widget>[];

        if (title != null) {
          final isHeader = items.isEmpty && badge == null;
          children.add(
            Padding(
              padding: EdgeInsets.only(top: isHeader ? 14 : 8, bottom: 6),
              child: Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: isHeader ? 16 : 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  if (external)
                    const Padding(
                      padding: EdgeInsets.only(left: 6),
                      child: Icon(Icons.open_in_new_rounded, size: 18, color: Colors.black54),
                    ),
                ],
              ),
            ),
          );
        }

        for (final t in items) {
          children.add(
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: InkWell(
                borderRadius: BorderRadius.circular(6),
                onTap: () => debugPrint('Tap: $t'),
                child: Text(
                  t,
                  style: const TextStyle(
                    color: link,
                    fontSize: 14.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        }

        if (badge != null) {
          children.add(
            Container(
              margin: const EdgeInsets.only(top: 2, bottom: 6),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFE9F2FF),
                borderRadius: BorderRadius.circular(999),
                border: Border.all(color: const Color(0xFFD1E4FF)),
              ),
              child: Text(
                badge,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF3A69B7),
                ),
              ),
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        );
      }).toList(),
    );
  }
}
