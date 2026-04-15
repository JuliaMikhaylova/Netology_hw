# Задание 1
def read_file_recipes(file_name):
    cook_book = {}

    with open(file_name, encoding='utf-8') as f:
        lines = [line.strip() for line in f if line.strip()]

        index_line = 0
        while index_line < len(lines):
            # Наименование блюда
            dish_name = lines[index_line]
            index_line += 1

            # Количество ингредиентов
            qty_ing = int(lines[index_line])
            index_line += 1

            # Ингредиенты
            ingredients = []
            for i in range(0, qty_ing):
                ing_line = lines[index_line].split(" | ")
                ing = {'ingredient_name': ing_line[0], 'quantity': int(ing_line[1]), 'measure': ing_line[2]}
                ingredients.append(ing)
                index_line += 1

            cook_book[dish_name] = ingredients

    return cook_book

# Задание 2
def get_shop_list_by_dishes(dishes, person_count):
    shop_list_ing = {}

    for dish in dishes:
        if dish in cook_book:
            for ingredient in cook_book[dish]:
                ingredient_name = ingredient['ingredient_name']
                qty = ingredient['quantity'] * person_count
                measure = ingredient['measure']

                if ingredient_name in shop_list_ing:
                    # Если ингредиент уже есть, проверяем единицы измерения
                    if shop_list_ing[ingredient_name]['measure'] == measure:
                        shop_list_ing[ingredient_name]['quantity'] += qty
                    else:
                        ing_new_name = f"{ingredient_name} ({measure})"
                        shop_list_ing[ing_new_name] = {'measure': measure, 'quantity': qty}
                else:
                    shop_list_ing[ingredient_name] = {'measure': measure, 'quantity': qty}

    return shop_list_ing

# Задание 3
def get_united_file(filename, united_file):
    files = {}
    for file in filename:
        with open(file, encoding='utf-8') as f:
            line_count = sum(1 for line in f)   # Подсчитываем количество строк в файле
            name = f.name                       # Название файла
            files[f.name] = line_count

    with open(united_file, 'w', encoding='utf-8') as final_file:
        for item in sorted(files.items(), key=lambda x: x[1], reverse=False):
            # Записываем название файла и кол-во строк в нем
            final_file.write(f'{item[0]}\n')
            final_file.write(f'{item[1]}\n')
            # Записываем содержимое файла
            with open(item[0], encoding='utf-8') as f:
                content = f.read()
                final_file.write(f'{content}\n')

    return print(f'Объединение в один файл завершено.')

# Запуск функций
cook_book = read_file_recipes('recipes.txt')
shop_list = get_shop_list_by_dishes(['Запеченный картофель', 'Омлет'], 2)
print(cook_book)
print(shop_list)

get_united_file(['1.txt', '2.txt', '3.txt'], 'output.txt')
