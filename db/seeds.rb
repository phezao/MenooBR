recipes = [
  {
    title: 'Tteokbokki com queijo gratinado',
    notes: 'Usar melado ou açúcar e não mel',
    ingredients_attributes: [
      { name: 'Tteok' },
      { name: 'Gochujang' },
      { name: 'Queijo Mussarela' },
      { name: 'Gengibre' },
      { name: 'Melado de cana' },
      { name: 'Alho' },
      { name: 'Molho de soja' },
      { name: 'Molho de ostra' },
      { name: 'Mirin' },
      { name: 'Óleo de gergelim' }
    ]
  },
  {
    title: 'Bulgogi',
    ingredients_attributes: [
      { name: 'Óleo de gergelim' },
      { name: 'Alho' },
      { name: 'Gengibre' },
      { name: 'Melado de cana' },
      { name: 'Mirin' },
      { name: 'Molho de soja' },
      { name: 'Pêra' },
      { name: 'Filet Mignon' }
    ]
  },
  {
    title: 'Arroz, frango grelhado e polenta frita',
    ingredients_attributes: [
      { name: 'Arroz' },
      { name: 'Alho' },
      { name: 'Frango sassami' },
      { name: 'farinha de milho' }
    ]
  },
  {
    title: 'Macarrão com molho de tomate',
    ingredients_attributes: [
      { name: 'Tomate pelado' },
      { name: 'Manjericão' },
      { name: 'Tomilho' },
      { name: 'Alecrim' },
      { name: 'Louro' },
      { name: 'Salsa' },
      { name: 'Cebola' },
      { name: 'Alho' },
      { name: 'Extrato de tomate' },
      { name: 'Penne' }
    ]
  },
  {
    title: 'Macarrão com molho limone e frango a milanesa',
    ingredients_attributes: [
      { name: 'Spaghetti' },
      { name: 'Leite' },
      { name: 'Queijo provolone' },
      { name: 'Limão' },
      { name: 'Farinha de trigo' },
      { name: 'Manteiga' },
      { name: 'Alho' },
      { name: 'Farinha Panko' },
      { name: 'Peito de frango' }
    ]
  },
  {
    title: 'Arroz, purê de batata, frango marinado',
    notes: 'Deixar o frango marinando por pelo menos umas 2 horas',
    ingredients_attributes: [
      { name: 'Frango sassami' },
      { name: 'Arroz' },
      { name: 'Batata' },
      { name: 'Manteiga' },
      { name: 'Leite' },
      { name: 'Limão' },
      { name: 'Azeite' },
      { name: 'Salsa' },
      { name: 'Tomilho' },
      { name: 'Coentro' },
      { name: 'Manjericão' }
    ]
  },
  {
    title: 'Arroz, Buldak e verduras grelhadas',
    ingredients_attributes: [
      { name: 'Frango sassami' },
      { name: 'Gochujang' },
      { name: 'Melado de cana' },
      { name: 'Molho de ostra' },
      { name: 'Molho de soja' },
      { name: 'Óleo de gergelim' },
      { name: 'Alho' },
      { name: 'Gengibre' },
      { name: 'Mirin' },
      { name: 'Cenoura' },
      { name: 'Abobrinha' },
      { name: 'Brócolis' },
      { name: 'Batata' },
      { name: 'Arroz' }
    ]
  },
  {
    title: 'Picadinho de carne, com arroz, batata frita e farofa',
    notes: 'Batata só pode ser a Asterix, e passar a carne na farinha antes',
    ingredients_attributes: [
      { name: 'Batata Asterix' },
      { name: 'Arroz' },
      { name: 'Paprica doce' },
      { name: 'Farofa' },
      { name: 'Filet Mignon' },
      { name: 'Cenoura' },
      { name: 'Cebola' },
      { name: 'Alho' },
      { name: 'Extrato de tomate' },
      { name: 'Molho inglês' },
      { name: 'Farinha de trigo' },
      { name: 'Limão' }
    ]
  },
  {
    title: 'Nhoque recheado com molho de tomate',
    ingredients_attributes: [
      { name: 'Tomate pelado' },
      { name: 'Manjericão' },
      { name: 'Tomilho' },
      { name: 'Alecrim' },
      { name: 'Louro' },
      { name: 'Salsa' },
      { name: 'Cebola' },
      { name: 'Alho' },
      { name: 'Extrato de tomate' },
      { name: 'Caldo de frango' },
      { name: 'Margarina' },
      { name: 'Farinha de trigo' },
      { name: 'Batata Asterix' },
      { name: 'Queijo Mussarela' }
    ]
  },
  {
    title: 'Estrogonofe de carne com batata frita',
    ingredients_attributes: [
      { name: 'Creme de leite' },
      { name: 'Alho' },
      { name: 'Cebola' },
      { name: 'Arroz' },
      { name: 'Molho de tomate' },
      { name: 'Filet Mignon' },
      { name: 'Batata Asterix' },
      { name: 'Conhaque' }
    ]
  },
  {
    title: 'Pão de Alho com frango',
    ingredients_attributes: [
      { name: 'Pão de Alho' },
      { name: 'Quejo Mussarela' },
      { name: 'Frango sassami' },
      { name: 'Lemon pepper' }
    ]
  }
]

recipes.each do |recipe|
  CreateRecipe.new(recipe).save
end
