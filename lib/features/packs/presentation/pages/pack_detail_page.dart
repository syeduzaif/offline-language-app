import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/database.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../home/presentation/controllers/home_state.dart';
import '../../../lesson/presentation/pages/lesson_page.dart';
import '../../data/repositories/packs_repository.dart';

class PackDetailPage extends ConsumerStatefulWidget {
  const PackDetailPage({super.key, required this.packId, required this.packName});
  final String packId;
  final String packName;

  @override
  ConsumerState<PackDetailPage> createState() => _PackDetailPageState();
}

class _PackDetailPageState extends ConsumerState<PackDetailPage> {
  late Future<List<Phrase>> _future;

  @override
  void initState() {
    super.initState();
    _future = ref.read(packsRepositoryProvider).phrasesInPack(widget.packId);
  }

  void _practice() {
    final code = ref.read(activeLanguageCodeProvider);
    if (code == null) return;
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => LessonPage(languageCode: code, packId: widget.packId),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.packName)),
      body: SafeArea(
        child: FutureBuilder<List<Phrase>>(
          future: _future,
          builder: (_, snap) {
            if (!snap.hasData) return const LoadingWidget();
            return _PhraseListBody(phrases: snap.data!, onPractice: _practice);
          },
        ),
      ),
    );
  }
}

class _PhraseListBody extends StatelessWidget {
  const _PhraseListBody({required this.phrases, required this.onPractice});
  final List<Phrase> phrases;
  final VoidCallback onPractice;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: kPagePadding,
            itemCount: phrases.length,
            separatorBuilder: (_, _) => const Divider(height: 1),
            itemBuilder: (_, i) => _PhraseTile(phrase: phrases[i]),
          ),
        ),
        Padding(
          padding: kPagePadding,
          child: FilledButton(onPressed: onPractice, child: const Text('Practice this pack')),
        ),
      ],
    );
  }
}

class _PhraseTile extends StatelessWidget {
  const _PhraseTile({required this.phrase});
  final Phrase phrase;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(phrase.nativePrompt),
      subtitle: Text(phrase.targetText, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}
