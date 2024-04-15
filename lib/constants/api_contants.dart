// class ApiConstants {
//   static Uri urlBase({String? categoria, String? descricao}) {
//     final Map<String, String> queryParams = {};

//     if (categoria != null && descricao != null) {
//       queryParams['nome_unidade'] = descricao;
//     }

//     final uri = Uri.parse("http://localhost:3001/dadosPlaca")
//         .replace(queryParameters: queryParams);

//     return uri;
//   }
// }
class ApiConstants {
  static Uri urlBase({String? categoria, String? descricao}) {
    final Map<String, String> queryParams = {};

    if (categoria != null && descricao != null) {
      queryParams[categoria] = descricao;
    } else if (categoria != null) {
      // Se a descrição não for fornecida, use o valor da categoria para o parâmetro 'nome_unidade'
      queryParams['nome_unidade'] = categoria;
    }

    final uri = Uri.parse("http://localhost:3001/dadosPlaca")
        .replace(queryParameters: queryParams);

    return uri;
  }
}
