import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../core/services/connectivity_service.dart';
import '../../../../core/services/database.dart';
import '../../../home/presentation/controllers/home_state.dart';
import '../../data/repositories/lookup_repository.dart';

class LookupPage extends ConsumerStatefulWidget {
  const LookupPage({super.key});

  @override
  ConsumerState<LookupPage> createState() => _LookupPageState();
}

class _LookupPageState extends ConsumerState<LookupPage> {
  final _controller = TextEditingController();
  bool _busy = false;
  String? _error;
  Phrase? _result;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _translate() async {
    final code = ref.read(activeLanguageCodeProvider);
    final text = _controller.text.trim();
    if (code == null || text.isEmpty) return;
    setState(() { _busy = true; _error = null; _result = null; });
    await _runLookup(text: text, code: code);
  }

  Future<void> _runLookup({required String text, required String code}) async {
    try {
      final phrase = await ref.read(lookupRepositoryProvider)
          .lookupAndSave(englishText: text, targetLangCode: code);
      if (mounted) setState(() { _result = phrase; _busy = false; });
    } on ApiException catch (e) {
      if (mounted) setState(() { _error = _friendlyMessage(e); _busy = false; });
    }
  }

  String _friendlyMessage(ApiException e) => switch (e.kind) {
        ApiExceptionKind.timeout => 'Network timed out',
        ApiExceptionKind.network => 'No internet connection',
        ApiExceptionKind.rateLimited => 'Rate limit reached — try later',
        ApiExceptionKind.serverError => 'Translation service is down',
        _ => 'Translation failed',
      };

  @override
  Widget build(BuildContext context) {
    final online = ref.watch(isOnlineProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Add a phrase')),
      body: SafeArea(
        child: Padding(
          padding: kPagePadding,
          child: _LookupBody(
            controller: _controller, online: online, busy: _busy,
            error: _error, result: _result, onTranslate: _translate,
          ),
        ),
      ),
    );
  }
}

class _LookupBody extends StatelessWidget {
  const _LookupBody({
    required this.controller, required this.online, required this.busy,
    required this.error, required this.result, required this.onTranslate,
  });
  final TextEditingController controller;
  final bool online;
  final bool busy;
  final String? error;
  final Phrase? result;
  final VoidCallback onTranslate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 16),
        if (!online) const _OfflineNotice(),
        _InputField(controller: controller, enabled: online && !busy),
        const SizedBox(height: 16),
        FilledButton(
          onPressed: online && !busy ? onTranslate : null,
          child: busy ? const _Spinner() : const Text('Translate & save'),
        ),
        const SizedBox(height: 24),
        if (error != null) _ErrorBox(message: error!),
        if (result != null) _ResultCard(phrase: result!),
      ],
    );
  }
}

class _OfflineNotice extends StatelessWidget {
  const _OfflineNotice();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.errorContainer,
      child: const ListTile(
        leading: Icon(Icons.cloud_off),
        title: Text('Offline'),
        subtitle: Text('Online required for translation. Bundled deck still works.'),
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  const _InputField({required this.controller, required this.enabled});
  final TextEditingController controller;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: enabled,
      autofocus: true,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'English phrase',
        hintText: 'e.g. Where is the bathroom?',
      ),
    );
  }
}

class _Spinner extends StatelessWidget {
  const _Spinner();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 22, width: 22,
      child: CircularProgressIndicator(strokeWidth: 2.5, color: Colors.white),
    );
  }
}

class _ErrorBox extends StatelessWidget {
  const _ErrorBox({required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Card(
      color: scheme.errorContainer,
      child: ListTile(
        leading: Icon(Icons.error_outline, color: scheme.onErrorContainer),
        title: Text(message, style: TextStyle(color: scheme.onErrorContainer)),
      ),
    );
  }
}

class _ResultCard extends StatelessWidget {
  const _ResultCard({required this.phrase});
  final Phrase phrase;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(phrase.nativePrompt, style: tt.titleMedium),
            const SizedBox(height: 8),
            Text(phrase.targetText, style: tt.headlineMedium),
            const SizedBox(height: 12),
            Text('Saved to your Custom pack.', style: tt.bodySmall),
          ],
        ),
      ),
    );
  }
}
