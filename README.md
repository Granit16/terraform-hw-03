# Домашнее задание к занятию «Управляющие конструкции в коде Terraform»

<details><summary>Задание 1</summary>

  Изучил проект и заполнил файл **personal.auto.tfvars** данными своего облака. Проект инициализровался успешно

  Доступ в «Группы безопасности» в ЛК Yandex Cloud есть.

  Скриншот входящих правил 

  ![](https://github.com/Granit16/terraform-hw-03/blob/main/screenshots/ingress.png)
</details>


<details><summary>Задание 2</summary>

  Описал в файле count-vm.tf создание двух веритаульных машин c использованием мета-аргумента **count loop**,
  а в файле **for_each-vm.tf** описал создание двух ВМ через используя мета-аргумент **for_each loop** c одной общей переменной.
  
  Для считывания ключа **~/.ssh/id_ed25519.pub** и его последующего использования в блоке metadata используется функция **file()**

  Инициализировал и выполнил проект

</details>

<details><summary>Задание 3</summary>

  В файле **disk_vm.tf** описал создание трех дисков по 1ГБ через мета-аргумент **count**.
  
  Создал еще один ресурс ВМ storage и подключил к нему созданные ранее диски через **dynamic secondary_disk{..}**

</details>


<details><summary>Задание 4</summary>

  В файле **ansible.tf** описал создание inventory-файла через шаблон .tftpl, в котором три группы: web, db, storage.

  Добавил переменную **fqdn** и выполнил код

  ![](https://github.com/Granit16/terraform-hw-03/blob/main/screenshots/inventory.png)


</details>

