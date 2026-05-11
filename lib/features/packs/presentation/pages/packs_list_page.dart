import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/database.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../home/presentation/controllers/home_state.dart';
import '../../data/repositories/packs_repository.dart';
import 'pack_detail_page.dart';

class PacksListPage extends ConsumerWidget {
  const PacksListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final code = ref.watch(activeLanguageCodeProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Topic Packs')),
      body: code == null
          ? const Center(child: Text('Pick a language first'))
          : _PacksList(languageCode: code),
    );
  }
}

class _PacksList extends ConsumerWidget {
  const _PacksList({required this.languageCode});
  final String languageCode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packs = ref.watch(packsForActiveLanguageProvider(languageCode));
    return packs.when(
      data: (list) => _PackGrid(packs: list),
      loading: () => const LoadingWidget(),
      error: (e, _) => Center(child: Text(e.toString())),
    );
  }
}

class _PackGrid extends StatelessWidget {
  const _PackGrid({required this.packs});
  final List<TopicPack> packs;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: kPagePadding,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12, childAspectRatio: 1.1,
      ),
      itemCount: packs.length,
      itemBuilder: (_, i) => _PackTile(pack: packs[i]),
    );
  }
}

class _PackTile extends StatelessWidget {
  const _PackTile({required this.pack});
  final TopicPack pack;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => PackDetailPage(packId: pack.id, packName: pack.name),
        )),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(pack.emoji, style: const TextStyle(fontSize: 48)),
              const SizedBox(height: 12),
              Text(pack.name, style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        ),
      ),
    );
  }
}
