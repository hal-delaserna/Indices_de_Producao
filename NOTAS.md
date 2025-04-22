**Abstract**
13/21/43

Este trabalho propõe o **Índice Aberto de Quantum Mineral (IAQM)**, uma iniciativa que constrói um índice econômico aberto para acompanhar o desempenho, em termos reais, da produção mineral brasileira. Fundamentado na metodologia dos índices de quantum, o IAQM isola as variações no volume físico produzido das flutuações inflacionárias ao adotar preços constantes. Utiliza dados abertos dos royalties da mineração, disponíveis portais de tranparência pública. O índice é implementado em uma plataforma open source, garantindo reprodutibilidade e controle pela sociedade civil. O IAQM contribui para fortalecer a governança pública, empoderar o controle social e fomentar análises técnicas rigorosas sobre tendências produtivas reais no setor mineral brasileiro.
palavras chave: Civic Tech / Dados Livres; Open Science; Open Government Data (OGD)

## ESTRUTURA

+ 1. Introdução
1.1 Revisão da literatura e apresentação de conceitos

Um índice 


O objetivo teórico mais geral dos índices de produção industrial é o de refletir a
evolução do valor adicionado ao longo do tempo. O valor adicionado mensurado pela
quantidade de bens e serviços produzidos (seja por estabelecimento, unidade local,
indústria etc.) que excede os insumos intermediários consumidos. Este pode ser medido
a preços correntes ou em termos de volume6. (IBGE, 2023, Notas Metô)

Índices de quantidades informam variações na produção física ao longo do tempo, tanto em termos de direção (alta ou baixa) quanto de intensidade (percentual de variação). O valor absoluto do índice, por si só, é adimensional e representa apenas a razão entre o período corrente e um período-base arbitrário. Assim, o índice é mais útil como medida de comparação temporal, e não como medida autônoma.


O IBGE também tem um índice de produção, um produto da PIM-PF. Mas o *índice de produção - industrias extrativas* abarca o setores de Petróleo & Gás (CNAE 0600-0/01), entre outros*

+ 2. Objetivo

“Meu objetivo é construir um índice de quantum da produção mineral brasileira, totalmente open source e baseado em dados de portais de transparência públicos. A iniciativa privilegia reprodutibilidade, transparência, empoderamento cívico e controle social.”


+ 3. Material e Método
3.1 Outliers
3.2 Amostragem
3.3 cálculo dos índices (Fisher)

+ 4. Resultados e Discussão



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
