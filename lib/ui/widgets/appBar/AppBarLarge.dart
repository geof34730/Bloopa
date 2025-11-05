import 'package:flutter/material.dart';
import '../../themes/bloopaExtras.dart';
import '../form/IntelligentSearchWidget.dart';
import 'MenuCategorieLarge.dart';
import 'MenuData.dart';

class AppBarLarge extends StatefulWidget implements PreferredSizeWidget {
  final double preferredHeight;

  const AppBarLarge({
    super.key,
    required this.preferredHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(preferredHeight);

  @override
  State<AppBarLarge> createState() => _AppBarLargeState();
}

class _AppBarLargeState extends State<AppBarLarge> {
  OverlayEntry? _barrierEntry;
  OverlayEntry? _menuEntry;
  String? _activeCategory;

  bool get _isMenuOpen => _menuEntry != null;

  @override
  void dispose() {
    _hideMenu();
    super.dispose();
  }

  /// Ouvre le menu si ce n'est pas déjà le bon.
  void _openFor(String category) {
    if (_activeCategory == category && _isMenuOpen) return;
    _showMenu(category);
  }

  void _toggleFor(String category) {
    if (_activeCategory == category && _isMenuOpen) {
      _hideMenu();
    } else {
      _showMenu(category);
    }
  }

  void _showMenu(String category) {
    _hideMenu();
    _activeCategory = category;

    final screenH = MediaQuery.of(context).size.height;
    final topOffset =
        MediaQuery.of(context).padding.top + widget.preferredHeight;
    final availableHeight = screenH - topOffset;

    // ⬇️ Barrier limité à la zone sous la nav (top: topOffset)
    _barrierEntry = OverlayEntry(
      builder: (_) => Positioned(
        top: topOffset,
        left: 0,
        right: 0,
        bottom: 0,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: _hideMenu,
          child: const SizedBox.expand(),
        ),
      ),
    );

    _menuEntry = OverlayEntry(
      builder: (_) => Positioned(
        top: topOffset,
        left: 0,
        right: 0,
        child: Material(
          type: MaterialType.transparency,
          child: MegaMenuLayer(
            category: category,
            maxHeight: availableHeight,
            onClose: _hideMenu,
          ),
        ),
      ),
    );

    Overlay.of(context, rootOverlay: true).insertAll([
      _barrierEntry!,
      _menuEntry!,
    ]);

    setState(() {});
  }


  void _hideMenu() {
    _menuEntry?..remove();
    _menuEntry = null;

    _barrierEntry?..remove();
    _barrierEntry = null;

    _activeCategory = null;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final topNav = MegaMenuData.topCategories;

    return AppBar(
      backgroundColor: kBloopaPrimaryContainer,
      elevation: 0,
      centerTitle: false,
      automaticallyImplyLeading: false,
      toolbarHeight: widget.preferredHeight,
      titleSpacing: 0,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Image.asset('assets/brand/bloopa.png', height: 44),
                  ),
                  Expanded(child: IntelligentSearchWidget(widthSearch: 1)),
                  const SizedBox(width: 8),
                  const _TopIcon(icon: Icons.notifications_none_rounded, label: 'Mes recherches'),
                  const _TopIcon(icon: Icons.favorite_border_rounded, label: 'Favoris'),
                  const _TopIcon(icon: Icons.chat_bubble_outline_rounded, label: 'Notifications'),
                  const _TopIcon(icon: Icons.person_outline_rounded, label: 'Se connecter'),
                ],
              ),

              const SizedBox(height: 8),

              SizedBox(
                height: 23,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, i) {
                    final item = topNav[i];
                    final active = _activeCategory == item && _isMenuOpen;
                    return _NavLink(
                      label: item,
                      active: active,
                      onTap: () => _toggleFor(item),   // tap = toggle
                      onHover: () => _openFor(item),   // hover = open
                    );
                  },
                  separatorBuilder: (_, __) => const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text('·', style: TextStyle(color: Colors.black54)),
                  ),
                  itemCount: topNav.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  const _TopIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    const Color c = kBloopaPrimary;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 22, color: c),
          const SizedBox(height: 2),
          Text(label, style: TextStyle(fontSize: 11, color: c)),
        ],
      ),
    );
  }
}

/// Lien de navigation avec gestion fiable du hover (web/desktop)
class _NavLink extends StatefulWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;
  final VoidCallback? onHover;

  const _NavLink({
    required this.label,
    required this.active,
    required this.onTap,
    this.onHover,
    super.key,
  });

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    const c = kBloopaPrimary;

    return MouseRegion(
      onEnter: (_) {
        setState(() => _hovering = true);
        widget.onHover?.call(); // déclenche l’ouverture
      },
      onHover: (_) {
        if (!_hovering) setState(() => _hovering = true);
      },
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: Material( // garantit un ancêtre Material pour InkWell
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: widget.onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.label,
                  style: TextStyle(
                    color: widget.active
                        ? c
                        : (_hovering ? c : Colors.black54),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (widget.active)
                  Container(
                    margin: const EdgeInsets.only(top: 1),
                    height: 2,
                    width: 40,
                    decoration: BoxDecoration(
                      color: c,
                      borderRadius: BorderRadius.circular(2),
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
