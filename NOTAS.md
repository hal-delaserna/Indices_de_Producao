**Abstract**  

Este trabalho propõe o **Índice Aberto de Quantum Mineral (IAQM)**, uma iniciativa que constrói um índice econômico aberto para acompanhar o desempenho, em termos reais, da produção mineral brasileira. Fundamentado na metodologia dos índices de quantum, o IAQM isola as variações no volume físico produzido das flutuações inflacionárias ao adotar preços constantes. Utiliza dados abertos dos royalties da mineração, disponíveis portais de tranparência pública. O índice é implementado em uma plataforma open source, garantindo reprodutibilidade e controle pela sociedade civil. O IAQM contribui para fortalecer a governança pública, empoderar o controle social e fomentar análises técnicas rigorosas sobre tendências produtivas reais no setor mineral brasileiro.  
palavras chave: Civic Tech / Dados Livres; Open Science; Open Government Data (OGD)  

## ESTRUTURA

### 1. Introdução    

#### 1.1 Revisão da literatura e apresentação de conceitos      


Conceituação; serventia; propriedades/qualidades       

Números índices são medidas estatísticas de síntese, uma forma de medir fenômenos sociais ou naturais atribuindo uma grandeza numérica a um conjunto de observações em análise.     

Números-índices são adimensionais, livres de escala, próprios para serem comparados com eles mesmos dentro da série histórica. Permitem a avaliar a mudança de um fenômeno pelo seu estado no tempo: sua variação, em intensidade e direção (crescimento/descrescimento).     

A aplicação mais célebre entre o grande público é seu uso como medida da inflação de preços. E dentre os primeiros números índices surgidos, como os índice criado por Etiénne de Laspeyres e ou o índice de Hermann Paasche, que levam seus respectivos nomes, foram concebidos com esse propósito, o de medir a evolução do custo de vida pela variação do preços.  

Em seu trabalho seminal Laspeyres utilizou uma cesta de bens representativa do consumo das famílias para comparar preços ao longo do tempo, mantendo as quantidades constantes (baseadas no período inicial). Esse método permitia avaliar quanto o custo para adquirir a mesma quantidade de bens havia aumentado ou diminuído — ou seja, ele estava preocupado com o poder de compra e o impacto da inflação no bem-estar econômico. LASPEYRES (1871).     


$$[LASPEYRES]$$     

Poucos anos depois, Hermann Paasche, propôs uma alteração na formulação de Laspeyres. Argumentava que para preservar a cesta de bens como representativa do custo de vida, ela deveria mudar a cada período considerado. Assim, sua alternativa foi manter os preços constantes do período base, mas utilizando as quantidades do período corrente para ponderação. Em outras palavras, enquanto Laspeyres fixa as quantidades do passado, Paasche atualiza os pesos com base na realidade mais recente, procurando refletir com maior aderência o comportamento efetivo do consumidor ou do produtor no presente.    


$$[PAASCHE]$$     


Embora os números índices tenham surgido sob o contexto de medir a inflação de preços eles também se prestam a serem índices de quantidade (*quantum*). Os números-índices de quantum mensuram as variações no volume físico de produção ou consumo ao longo do tempo, isolando os efeitos de mudanças nominais nos preços.     

Essa metodologia é amplamente empregada em análises macroeconômicas, como na construção de indicadores de produção industrial, Produto Interno Bruto (PIB) real, e no acompanhamento de setores específicos da economia. Ao eliminar o efeito da inflação ou de variações nominais de preços, os índices de quantum permitem uma avaliação mais precisa do crescimento real da atividade econômica, sendo essenciais para formulação de políticas públicas, estudos setoriais e planejamento estratégico.    

Existem diversas fórmulas para a construção de índices de quantum, derivadas das abordagens propostas por Laspeyres, Paasche e Fisher. A escolha da metodologia adequada depende do objetivo da análise, da disponibilidade de dados e das propriedades desejadas no índice, como facilidade de cálculo, atualização e representatividade estatística.    

No contexto da produção mineral, a aplicação de um índice de quantum revela-se particularmente pertinente. O setor mineral é caracterizado por elevada volatilidade de preços no mercado internacional, o que pode distorcer análises baseadas em valores nominais. A construção de um índice que reflita apenas as variações físicas da produção contribui para diagnósticos mais precisos sobre o desempenho real do setor.    

É nesse cenário que se insere o Índice Aberto de Quantum Mineral (IAQM), proposto neste trabalho. O IAQM adota a lógica dos números-índices de quantum para acompanhar a evolução da produção mineral brasileira, desconsiderando flutuações de preços e focando exclusivamente no volume físico produzido.    



Índices de quantidade não se limitam comparam as quantidades físicas, em massa ou volume (Kg, m3 ou litros). Para esse fim bastaria o quociente entre as quantidades pra mediar a alteração no peso/volume.

Mas desejamos medir é a relevância econômica das variações nas quantidades. O aumento na produção de um bem de preço mais alto impacta mais o valor da produção, pois ele tem mais valor adicionado.

Por isso falamos que medidos as **variações reais** na produção e não a mera alteração de peso/volume produzido.



                     O objetivo teórico mais geral dos índices de produção industrial é o de refletir a  
                     evolução do valor adicionado ao longo do tempo. O valor adicionado mensurado pela  
                     quantidade de bens e serviços produzidos (seja por estabelecimento, unidade local,  
                     indústria etc.) que excede os insumos intermediários consumidos. Este pode ser medido  
                     a preços correntes ou em termos de volume6. (IBGE, 2023, Notas Metô) 




A formulação do IAQM será orientada por critérios metodológicos sólidos, considerando as propriedades essenciais que garantem a robustez de um número-índice, como consistência temporal, reversibilidade e invariância à unidade de medida. Essas características serão detalhadas na próxima seção, dedicada à discussão das Propriedades dos Números-Índices, onde se apresentarão os fundamentos teóricos que norteiam a construção de índices econômicos confiáveis e tecnicamente adequados.    



Índices de quantidades informam variações na produção física ao longo do tempo, tanto em termos de direção (alta ou baixa) quanto de intensidade (percentual de variação). O valor absoluto do índice, por si só, é adimensional e representa apenas a razão entre o período corrente e um período-base arbitrário. Assim, o índice é mais útil como medida de comparação temporal, e não como medida autônoma.    


O IBGE também tem um índice de produção, um produto da PIM-PF. Mas o *índice de produção - industrias extrativas* abarca o setores de Petróleo & Gás (CNAE 0600-0/01), entre outros*    


#### 2.4 Propriedades dos Números-Índices
A construção de números-índices confiáveis requer a observância de um conjunto de propriedades axiomáticas que asseguram sua consistência lógica e interpretabilidade econômica. Diversos autores propuseram critérios desejáveis que um índice deve satisfazer, sobretudo nas formulações clássicas de Laspeyres, Paasche e Fisher. Entre as propriedades mais discutidas estão: proporcionalidade, identidade, reversibilidade temporal, invariância à unidade de medida e consistência na agregação (DIEWERT, 1993; ILO, 2004).

a) Proporcionalidade (ou escala)
A propriedade da proporcionalidade afirma que, se todos os preços (ou quantidades) em um período forem multiplicados por uma constante positiva, o número-índice deve refletir essa mudança proporcional.

Para índices de preços:

Se 

[fórmula]

Essa propriedade assegura que o índice responde de forma previsível a mudanças homogêneas nas variáveis agregadas.

b) Identidade
Um bom índice deve ser igual a 1 quando os preços (ou quantidades) não variam entre os dois períodos comparados, ou seja, se 

[fórmula]

Isso garante que o índice reconheça situações de invariância como neutras.

c) Reversibilidade Temporal
A propriedade da reversibilidade exige que, se o índice for calculado no sentido inverso do tempo, ele seja o inverso do índice original:

[fórmula]

Essa propriedade é particularmente importante em comparações bilaterais de períodos.

d) Reversibilidade de Fatores (ou consistência de decomposição)
Relaciona-se à decomposição da variação de valor em dois fatores: preços e quantidades. Exige que a multiplicação do índice de preços pelo índice de quantum resulte no índice de valor agregado:

[fórmula]
 
Essa relação mostra como o valor total pode ser decomposto de forma consistente entre os dois efeitos.

e) Invariância à unidade de medida
O índice deve ser inalterado quando os preços ou quantidades forem expressos em unidades diferentes, desde que a conversão seja proporcional. Por exemplo, medir minério em toneladas ou quilogramas não deve afetar o índice.

f) Consistência na agregação
Exige que a agregação de subíndices em um índice geral obedeça à lógica hierárquica e não contradiga os índices de componentes. Isso é especialmente importante em setores com múltiplos produtos, como o setor mineral.

Essas propriedades não são simultaneamente satisfeitas por todos os tipos de índices. Por exemplo, o índice de Laspeyres satisfaz a identidade e a proporcionalidade, mas não a reversibilidade temporal. Já o índice de Fisher, média geométrica entre Laspeyres e Paasche, é conhecido por satisfazer um maior número de propriedades desejáveis.

A seção empírica deste trabalho considerará essas propriedades como critérios técnicos na escolha e avaliação da fórmula adotada para o Índice Aberto de Quantum Mineral (IAQM).








## 2. Objetivo    

“Meu objetivo é construir um índice de quantum da produção mineral brasileira, totalmente open source e baseado em dados de portais de transparência públicos. A iniciativa privilegia reprodutibilidade, transparência, empoderamento cívico e controle social.”  


## 3. Material e Método    


### 3.1 Outliers:  

MAD (Desvio Mediano Absoluto)



### 3.2 Amostragem    

Uso de subíndices pelos critérios seguintes: 

+ Diferentes alíquotas:

+ Diferentes unidades de medida: i) Água Mineral (L); Gemas (g); Gemas(ct); Rochas Ornamentais (m2); Demais substâncias (t)

+ Desproporções de representatividade: Ferro; Agregados; Demais substâncias



### 3.3 cálculo dos índices (Fisher)    


## 4. Resultados e Discussão     





## Bibliografia    

INTERNATIONAL LABOUR OFFICE – ILO. Consumer Price Index Manual: Theory and Practice. Geneva: ILO, 2004.

OECD. Producer Price Indices – Methodology. Paris: OECD Publishing, 2004.



--------------------------------------------------------------------------  
## 1. Limpeza da base


**1.1 Identificar outliers**  

+ Detecção de outliers  
   + Estratificar por substância e mês  
   + IQR  
   + MAD  


+ Usar 2 critérios baseados nos tamanhos do estrato:  
   + Para substâncias com N > 30: usar MAD por substância e trimestre  
   + Se N < 30: log-retornos  
      + Limiar p/ log‑retornos: Uma prática simples é supor variação log‑normal no preço unitário intra‑trimestre; que tende a se aproximar de Normal.  

**1.2 Identificar bons declarantes**  





## 2. Amostragem

+ **amostra aleatória estratificada**   



+ **Amostra longitudinal estratificada**   






**Aleatória simples ou sistemática:** sistemática, coletando boas declarações  

Princípios de Amostragem que Devem Ser Seguidos  
**(A) Representatividade:** refletir a estrutura do setor   

**(B) Consistência ao Longo do Tempo (Longitudinalidade):**  
+ Amostra longitudinal: inclui sempre os mesmos indivíduos  


**(D) Estratificação (Opcional)**  

+ Identificar segmentos (porte, região, substância). Represente-os na amostra.   
	+ mutuamente exclusivos (não sobrepostos)   
	+ coletivamente exaustivos (cobrir todo o universo).  

+ Amostragem Desproporcional (ou Sobre-amostragem):  
Quando os extratos participam da amostra em proporção diversa a que participam na população. 	  

+ Aplicar fatores de expansão para ajustar a contribuição de cada estrato.  




### Base fixa ou Encadeado?

**Encadeado**: incorpora mudanças nos preços relativos (tecnologia/produtividade/obsolescência; preferências)    
Base Fixa: medir variação ao longo do tempo em relação a um ponto fixo    




1. **Metais Ferrosos**    
   - Principais minérios: ferro (hematita, magnetita), manganês (pirolusita), cromo (crocoíta), níquel (pentlandita) etc.    
   - Característica fundamental: contêm ferro em quantidade significativa ou se relacionam diretamente à produção de aço e ligas ferrosas.  

2. **Metais Não-Ferrosos**    
   - Principais minérios: cobre (calcopirita), alumínio (bauxita), chumbo (galena), zinco (esfalerita), estanho (cassiterita) etc.    
   - São metais que não contêm ferro como elemento principal e geralmente apresentam características como alta condutividade elétrica e resistência à corrosão (dependendo do metal específico).  

3. **Metais Preciosos e/ou Nobres**    
   - Principais minérios: ouro (nativo, eletro), prata (argentita), platina (minerais do grupo da platina), paládio etc.    

4. **Agregados de Construção (Materiais de Construção)**    
   - Principais materiais: areia, brita, cascalho, rochas para brita (granito, basalto), rochas ornamentais (mármore, granito), argila (para cerâmica vermelha).    
   - Empregados em grandes quantidades na construção civil (estruturas, pavimentação e acabamento).  

5. **Minerais Industriais e Não-Metálicos**    
   - Incluem: calcário (para cimento e cal), gesso, argilas especiais (caulim, bentonita), fluorita, fosfatos, quartzo (sílica), barita, talco, magnesita etc.    
   - Têm amplo uso na indústria química, cerâmica, siderúrgica (fundentes), alimentação animal, fertilizantes, papel, vidro, entre outros.  

6. **Minerais Energéticos**    
   - Principais: carvão mineral, urânio, tório (minerais radioativos).    

7. **Terras-Raras**    

8. **Pedras Preciosas (Gemas)**    
