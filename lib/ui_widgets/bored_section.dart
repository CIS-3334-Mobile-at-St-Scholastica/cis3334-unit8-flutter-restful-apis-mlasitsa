import 'package:flutter/material.dart';
import '../data_models/bored_activity_model.dart';
import '../services/bored_service.dart' as bored_svc;

class BoredSection extends StatelessWidget {
  const BoredSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<BoredActivity>(
      future: bored_svc.fetchBoredActivity(),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting ||
            snap.connectionState == ConnectionState.active) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snap.hasError) return Center(child: Text('Error: ${snap.error}'));
        final activity = snap.data;
        if (activity == null) {
          return const Center(child: Text('No activity found.'));
        }

        final subtitle = [
          'Type: ${activity.type}',
          'Participants: ${activity.participants}',
          'Price: ${activity.price.toStringAsFixed(2)}',
          'Availability: ${activity.availability.toStringAsFixed(2)}',
          if (activity.duration.isNotEmpty) 'Duration: ${activity.duration}',
          if (activity.accessibilityText.isNotEmpty)
            'Accessibility: ${activity.accessibilityText}',
          'Kid friendly: ${activity.kidFriendly ? "Yes" : "No"}',
          if (activity.link.isNotEmpty) 'Link: ${activity.link}',
        ].join(' • ');

        return Card(
          elevation: 2,
          child: ListTile(
            leading: const Icon(Icons.casino),
            title: Text(activity.activity),
            subtitle: Text(subtitle),
            isThreeLine: activity.link.isNotEmpty,
          ),
        );
      },
    );
  }
}
