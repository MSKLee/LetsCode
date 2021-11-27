class Cliente():
    
    # Método Construtor
    def __init__(self, lista_database, lista_pessoas, k):
        self.lista_database = lista_database
        self.lista_pessoas = lista_pessoas
        self.k = k
    
    # Função Lista para Dicionário
    def lista_dicionario(self, lista):
        dicionario_lista = {} 
        for indice, perfil in enumerate(lista):
            dicionario_lista[indice] = perfil
        return dicionario_lista

    # Função Lista de Distâncias Mais Próximas
    def lista_distancia(self):
        c = []
        for j in range(len(self.lista_pessoas)):
            for i in range(len(self.lista_database)):
                c.append(sum([(x - y) ** 2 for x, y in zip(self.lista_database[i][2], self.lista_pessoas[j][2])]) ** (1/2))

        multiplo = int(len(c)/len(self.lista_pessoas))

        subdist = [c[n:n+multiplo] for n in range(0, len(c), multiplo)]
        return subdist


    # Função de Moda

    def moda(self, lista):
        repeticao = 0
        num = lista[0]

        for i in lista:
            frequencia = lista.count(i)
            if(frequencia> repeticao):
                repeticao = frequencia
                num = i
        return num


    # Função dos 3 perfis mais próximos

    def menores_distancias(self):

        output = []
        dicionario_distancia = {}

        for i in range(len(self.lista_distancia())):
            for a, b in enumerate(self.lista_distancia()[i]):
                dicionario_distancia[a] = b
            dicionario_dist_ordenado = dict(sorted(dicionario_distancia.items(), key=lambda item: item[1]))
            lista2 = list(dicionario_dist_ordenado)[:self.k]

            for i in lista2:
                output.append(self.lista_dicionario(self.lista_database)[i][1])     
            resultado = [output[n:n+self.k] for n in range(0, len(output), self.k)]        
        return resultado


    # Função Perfis Corretos
    def lista_perfis_corretos (self):
        lista_perfis = []
        for perfil in self.menores_distancias():
            lista_perfis.append(self.moda(perfil))
        return lista_perfis

    # Função Resultado Final
    def resultado_final(self):
        dicionario_final = {}
        for i in range(len(self.lista_pessoas)):
            dicionario_final[self.lista_pessoas[i][0]] = self.lista_perfis_corretos()[i]
        return dicionario_final