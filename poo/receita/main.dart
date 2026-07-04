import './Receita.dart';

void main(){
    Receita macarrao = Receita(nome: "Macarrão ao pesto",preco: 20);
    Receita lasanha = Receita(nome: "Lasanha 4 queijos",preco:32);
    Receita burrata = Receita(nome: "Burrata com pesto", preco: 28);

    List<Receita> receitas = <Receita>[macarrao,lasanha,burrata];

    print(receitas);
}