import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guess_with_friends/src/core/theme/app_palette.dart';
import 'package:guess_with_friends/src/core/theme/app_palettes.dart';
import 'package:guess_with_friends/src/core/theme/theme_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SelectThemePage extends ConsumerStatefulWidget {
  const SelectThemePage({super.key});

  @override
  ConsumerState<SelectThemePage> createState() => _SelectThemePageState();
}

class _SelectThemePageState extends ConsumerState<SelectThemePage> {
  int _currentIndex = 0;

  List<AppPalette> get _themes => AppPalettes.all;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final currentTheme = ref.read(themeProvider).value;
    final currentIndex = _themes.indexWhere((e) => e.id == currentTheme?.id);

    _currentIndex = currentIndex >= 0 ? currentIndex : 0;
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _applyTheme() async {
    final selectedTheme = _themes[_currentIndex];
    await ref.read(themeProvider.notifier).setTheme(selectedTheme.id);
  }

  void setPage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentThemeAsync = ref.watch(themeProvider);
    final appliedThemeId = currentThemeAsync.value?.id;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Choose theme'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),
            Expanded(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: Size.infinite.height,
                    onPageChanged: (index, reason) => setPage(index),
                  ),
                  items: _themes.map((theme) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 500),
                            child: _ThemeShowcaseCard(
                              palette: theme,
                              isApplied: appliedThemeId == theme.id,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                )
            ),
            const SizedBox(height: 8),
            _ThemeMetaSection(
              palette: _themes[_currentIndex],
              currentIndex: _currentIndex,
              total: _themes.length,
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 500),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _applyTheme,
                    child: const Text('Apply theme'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ThemeMetaSection extends StatelessWidget {
  final AppPalette palette;
  final int currentIndex;
  final int total;

  const _ThemeMetaSection({
    required this.palette,
    required this.currentIndex,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          palette.name,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Swipe left or right to preview themes',
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            total,
                (index) {
              final active = index == currentIndex;

              return AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: active ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: active ? palette.primaryColor : palette.textMutedColor.withValues(alpha: 0.35),
                  borderRadius: BorderRadius.circular(999),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ThemeShowcaseCard extends StatelessWidget {
  final AppPalette palette;
  final bool isApplied;

  const _ThemeShowcaseCard({
    required this.palette,
    required this.isApplied,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: palette.backgroundGradient,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: isApplied ? palette.primaryColor : palette.borderColor,
          width: isApplied ? 2 : 1,
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                _PreviewPhoneTopBar(
                  palette: palette,
                  isApplied: isApplied,
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: _PreviewPhoneUi(
                    palette: palette,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PreviewPhoneTopBar extends StatelessWidget {
  final AppPalette palette;
  final bool isApplied;

  const _PreviewPhoneTopBar({
    required this.palette,
    required this.isApplied,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: palette.surfaceStrongColor,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: palette.borderColor),
          ),
          child: Icon(
            Icons.palette_outlined,
            color: palette.primaryColor,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            palette.name,
            style: TextStyle(
              color: palette.textColor,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        if (isApplied)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            decoration: BoxDecoration(
              color: palette.primaryColor,
              borderRadius: BorderRadius.circular(999),
            ),
            child: const Text(
              'ACTIVE',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 11,
              ),
            ),
          ),
      ],
    );
  }
}

class _PreviewPhoneUi extends StatelessWidget {
  final AppPalette palette;

  const _PreviewPhoneUi({
    required this.palette,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _previewHero(),
        const SizedBox(height: 14),
        _previewSearch(),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _chip('Solo', true)),
            const SizedBox(width: 8),
            Expanded(child: _chip('Party', false)),
            const SizedBox(width: 8),
            Expanded(child: _chip('Ranked', false)),
          ],
        ),
        const SizedBox(height: 14),
        Expanded(
          child: Row(
            children: [
              Expanded(child: _leftCard()),
              const SizedBox(width: 10),
              Expanded(child: _rightPanel()),
            ],
          ),
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 52,
                decoration: BoxDecoration(
                  color: palette.primaryColor,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: palette.primaryColor.withValues(alpha: 0.25),
                      blurRadius: 18,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.play_arrow_rounded, color: Colors.white),
                    SizedBox(width: 6),
                    Text(
                      'Play now',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: palette.surfaceStrongColor,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: palette.borderColor),
              ),
              child: Icon(
                Icons.favorite_border,
                color: palette.textColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _previewHero() {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          colors: [
            palette.primaryColor.withValues(alpha: 0.95),
            palette.primaryHoverColor.withValues(alpha: 0.85),
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 18,
            top: 18,
            child: Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.16),
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
          Positioned(
            right: 18,
            top: 18,
            child: Container(
              width: 66,
              height: 12,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.22),
                borderRadius: BorderRadius.circular(999),
              ),
            ),
          ),
          Positioned(
            left: 18,
            bottom: 24,
            child: Container(
              width: 120,
              height: 12,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.30),
                borderRadius: BorderRadius.circular(999),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _previewSearch() {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: palette.surfaceColor,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: palette.borderColor),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: palette.textMutedColor),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 10,
              decoration: BoxDecoration(
                color: palette.textMutedColor.withValues(alpha: 0.20),
                borderRadius: BorderRadius.circular(999),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip(String label, bool active) {
    return Container(
      height: 34,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: active ? palette.primaryColor : palette.surfaceColor,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: active ? palette.primaryColor : palette.borderColor,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: active ? Colors.white : palette.textMutedColor,
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _leftCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: palette.surfaceStrongColor,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: palette.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _line(palette.textColor.withValues(alpha: 0.95), 0.70),
          const SizedBox(height: 8),
          _line(palette.textMutedColor.withValues(alpha: 0.55), 0.48),
          const SizedBox(height: 14),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: palette.surfaceColor,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 10,
                  decoration: BoxDecoration(
                    color: palette.successColor,
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Container(
                  height: 10,
                  decoration: BoxDecoration(
                    color: palette.halfSuccessColor,
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _rightPanel() {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: palette.surfaceStrongColor,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: palette.borderColor),
            ),
            child: Center(
              child: Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  color: palette.primaryColor.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Icon(
                  Icons.music_note_rounded,
                  color: palette.primaryColor,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: palette.surfaceStrongColor,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: palette.borderColor),
            ),
            child: Center(
              child: Icon(
                Icons.bar_chart_rounded,
                color: palette.textColor,
                size: 34,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _line(Color color, double widthFactor) {
    return FractionallySizedBox(
      widthFactor: widthFactor,
      child: Container(
        height: 10,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(999),
        ),
      ),
    );
  }
}