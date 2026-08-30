import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:gestion_meuble/features/auth/connexion_page.dart';

void main() {
  testWidgets("L'écran de connexion affiche les champs email et mot de passe", (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: ConnexionPage())),
    );
    await tester.pumpAndSettle();

    expect(find.text('Gestion Meuble'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Mot de passe'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Se connecter'), findsOneWidget);
  });
}
