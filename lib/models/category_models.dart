class CategoryModel {
  final String? equipamento;
  final String? codigoEquipamento;
  final String? macAddress;
  final String? nomeSetor;
  final String? nomeUnidade;
  final String? camposAdicionaisPlaca;
  final String? id;

  CategoryModel({
    this.equipamento,
    this.codigoEquipamento,
    this.macAddress,
    this.nomeSetor,
    this.nomeUnidade,
    this.camposAdicionaisPlaca,
    this.id,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      equipamento: json['equipamento'],
      codigoEquipamento: json['codigo_equipamento'],
      macAddress: json['mac_address'],
      nomeSetor: json['nome_setor'],
      nomeUnidade: json['nome_unidade'],
      camposAdicionaisPlaca: json['campos_adicionais_placa'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'equipamento': equipamento,
      'codigo_equipamento': codigoEquipamento,
      'mac_address': macAddress,
      'nome_setor': nomeSetor,
      'nome_unidade': nomeUnidade,
      'campos_adicionais_placa': camposAdicionaisPlaca,
      'id': id,
    };
  }
}
