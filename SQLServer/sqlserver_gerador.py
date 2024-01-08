from faker import Faker
import random
import datetime

fakeEN = Faker()
fake = Faker('pt_BR')
Faker.seed(666)
random.seed(666)

def retorna_data_ou_null(data):
    y = data.split("-")
    data_inicial = datetime.datetime(int(y[0]), int(y[1]), int(y[2]))

    data_final = data_inicial + datetime.timedelta(days = random.randint(1,31))
    m = random.randint(0, 100)
    data_devolvido = data_inicial + datetime.timedelta(days = random.randint(1,31))
    if m == 42:
        return (data_inicial.strftime("%Y-%m-%d"), data_final.strftime("%Y-%m-%d"), "NULL")
    else:
        return (data_inicial.strftime("%Y-%m-%d"), data_final.strftime("%Y-%m-%d"), data_devolvido.strftime("'%Y-%m-%d'"))

lista_cpfs = [fake.unique.ssn() for i in range(7000)]
lista_isbn13 = [fake.unique.isbn13() for i in range(6000)]

def fake_autores():
    with open('100_autores.txt', 'w') as f:
        for i in range(0, 100):
            f.write("insert into autores (nome_autor, sobrenome_autor) values ('{}', '{}');\n".format(fake.first_name(), fake.last_name()))

def fake_livros():
    with open('6000_livros.txt', 'w') as f:
        for i in range(0, 6000):
            f.write("insert into livros values ('{}', '{}', '{}', '{}', '{}');\n".format(lista_isbn13[i], fake.catch_phrase(), fake.date(), random.randint(1, 100), random.randint(1, 20)))

def fake_clientes():
    with open('7000_clientes.txt', 'w') as f:
        for i in range(0, 7000):
            f.write("insert into usuarios values ('{}', '{}', '{}', '{}', '{}');\n".format(lista_cpfs[i], fake.name(), fakeEN.address(), fake.phone_number(), fake.ascii_email()))

def fake_emprestados():
    with open('5100_emprestados.txt', 'w') as f:
        for i in range(0, 5100):
            datas = retorna_data_ou_null(fake.date())
            f.write("insert into livros_emprestados (data_expedido, data_limite, data_retornado, id_contrato, cpf, isbn) values ('{}', '{}', {}, '{}', '{}', '{}');\n".format(datas[0], datas[1], datas[2], fake.unique.ean(length = 13), lista_cpfs[i], lista_isbn13[i]))

fake_autores()
fake_livros()
fake_clientes()
fake_emprestados()