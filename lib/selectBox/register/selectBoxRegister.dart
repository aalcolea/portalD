import 'package:flutter/material.dart';

class PoliticalPartiesBox extends StatefulWidget {
  final void Function(String?) onSelectPoliticalParties;

  const PoliticalPartiesBox(
      {super.key, required this.onSelectPoliticalParties});

  @override
  State<PoliticalPartiesBox> createState() => _PoliticalPartiesBoxState();
}

class _PoliticalPartiesBoxState extends State<PoliticalPartiesBox> {
  String partidoPoli = '';
  List<String> partidos = [
    'PAN',
    'PRI',
    'PRD',
    'Morena',
    'Movimiento Ciudadano',
    'Partido Verde'
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Seleccione Partido Político',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      value: partidoPoli.isEmpty ? null : partidoPoli,
      items: partidos.map((String partido) {
        return DropdownMenuItem<String>(
          value: partido,
          child: Text(partido),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          partidoPoli = newValue!;
          widget.onSelectPoliticalParties(partidoPoli);
        });
      },
    );
  }
}

class PoliticalChargesBox extends StatefulWidget {
  final Function(bool) onChooseTypeofCharge;

  const PoliticalChargesBox({super.key, required this.onChooseTypeofCharge});

  @override
  State<PoliticalChargesBox> createState() => _PoliticalChargesBoxState();
}

class _PoliticalChargesBoxState extends State<PoliticalChargesBox> {
  String? cargoPoli;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Seleccione Cargo Político',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      ),
      value: cargoPoli,
      onChanged: (String? newValue) {
        setState(() {
          cargoPoli = newValue;
        });
        if (newValue == 'Legislativo') {
          widget.onChooseTypeofCharge(false);
        } else if (newValue == 'Administración Pública') {
          widget.onChooseTypeofCharge(true);
        }
      },
      items: <String>['Legislativo', 'Administración Pública']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class LegislativeChargesBox extends StatefulWidget {
  final void Function(String?) onSelectLegislativeCharges;

  const LegislativeChargesBox(
      {super.key, required this.onSelectLegislativeCharges});

  @override
  State<LegislativeChargesBox> createState() => _LegislativeChargesBoxState();
}

class _LegislativeChargesBoxState extends State<LegislativeChargesBox> {
  String? cargoLegis;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Seleccione Cargo Legislativo',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      value: cargoLegis,
      items: const [
        DropdownMenuItem(
            value: 'Diputado Local', child: Text('Diputado Local')),
        DropdownMenuItem(
            value: 'Diputado Federal', child: Text('Diputado Federal')),
        DropdownMenuItem(value: 'Senador', child: Text('Senador')),
        DropdownMenuItem(
            value: 'Presidente de Partido',
            child: Text('Presidente de Partido')),
        DropdownMenuItem(value: 'Regidores', child: Text('Regidores')),
      ],
      onChanged: (String? newValue) {
        setState(() {
          cargoLegis = newValue;
          widget.onSelectLegislativeCharges(cargoLegis);
        });
      },
    );
  }
}

class PublicAdminChargesBox extends StatefulWidget {
  final void Function(String?) onSelectPublicCharge;

  const PublicAdminChargesBox({super.key, required this.onSelectPublicCharge});

  @override
  State<PublicAdminChargesBox> createState() => _PublicAdminChargesBoxState();
}

class _PublicAdminChargesBoxState extends State<PublicAdminChargesBox> {
  String? cargoAdmin;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Seleccione Cargo Público',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      value: cargoAdmin,
      items: const [
        DropdownMenuItem(
            value: 'Presidente Municipal', child: Text('Presidente Municipal')),
        DropdownMenuItem(value: 'Gobernado', child: Text('Gobernado')),
        DropdownMenuItem(
            value: 'Presidente de la República',
            child: Text('Presidente de la República')),
        DropdownMenuItem(value: 'Síndicos', child: Text('Síndicos')),
        DropdownMenuItem(value: 'Regidores', child: Text('Regidores')),
        DropdownMenuItem(value: 'Candidatos', child: Text('Candidatos')),
      ],
      onChanged: (String? newValue) {
        setState(() {
          cargoAdmin = newValue;
          widget.onSelectPublicCharge(cargoAdmin);
        });
      },
    );
  }
}
