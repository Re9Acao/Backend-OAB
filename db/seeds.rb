puts "🧹 Limpando dados antigos..."
StandardAnswer.destroy_all
Question.destroy_all
LawArea.destroy_all

puts "✅ Criando áreas do direito..."
areas = [
  { name: "Direito Civil", description: "Área do direito que cuida das relações privadas entre as pessoas." },
  { name: "Direito Penal", description: "Área do direito que regula as infrações criminais e suas punições." },
  { name: "Direito Constitucional", description: "Área do direito que cuida da Constituição e das normas fundamentais do Estado." },
  { name: "Direito Administrativo", description: "Área do direito que regula a administração pública e a atuação do poder executivo." },
  { name: "Direito do Trabalho", description: "Área do direito que trata das relações entre empregados e empregadores." },
  { name: "Direito Tributário", description: "Área do direito que regula a arrecadação de tributos e as relações fiscais do Estado com o contribuinte." },
  { name: "Direito Comercial", description: "Área do direito que regula as relações comerciais entre empresas e indivíduos." },
  { name: "Direito Internacional", description: "Área do direito que trata das relações entre Estados e organizações internacionais." },
  { name: "Direito Ambiental", description: "Área do direito que regula a proteção do meio ambiente e os recursos naturais." },
  { name: "Direito Eleitoral", description: "Área do direito que trata das eleições e da organização política do Estado." },
  { name: "Direito Empresarial", description: "Área do direito que regula as atividades empresariais e as relações jurídicas no mundo dos negócios." },
  { name: "Direito Agrário", description: "Área do direito que regula as relações jurídicas relativas à atividade agrícola e rural." },
  { name: "Direito do Consumidor", description: "Área do direito que protege os direitos dos consumidores em suas relações com fornecedores de produtos e serviços." },
  { name: "Direito Previdenciário", description: "Área do direito que trata da seguridade social, incluindo aposentadoria e benefícios para trabalhadores." },
  { name: "Direito de Família", description: "Área do direito que regula as relações familiares, incluindo casamento, divórcio e guarda de filhos." },
  { name: "Direito Processual Civil", description: "Área do direito que regula os procedimentos legais para resolver disputas civis." },
  { name: "Direito Processual Penal", description: "Área do direito que regula o processo penal, incluindo as etapas do julgamento criminal." },
  { name: "Direito Constitucional Internacional", description: "Área do direito que trata das normas constitucionais no contexto internacional." },
  { name: "Direito da Propriedade Intelectual", description: "Área do direito que protege as criações da mente humana, como patentes, direitos autorais e marcas." },
  { name: "Direito Marítimo", description: "Área do direito que regula as atividades no mar, incluindo transporte marítimo e comércio internacional." },
  { name: "Direito da Infância e Juventude", description: "Área do direito que regula os direitos das crianças e adolescentes, incluindo proteção e adoção." }
]

law_areas = {}
areas.each do |area|
  law_areas[area[:name]] = LawArea.find_or_create_by!(name: area[:name]) do |law_area|
    law_area.description = area[:description]
  end
end

puts "✅ Criando questões..."

questions = [
  {
    title: "O Presidente da República decretou estado de defesa em parte da Região Centro-Oeste do país, após ouvir os Conselhos. O Congresso tomou ciência do decreto 12 horas depois. Sobre essa hipótese, segundo o sistema jurídico-constitucional brasileiro, assinale a afirmativa correta.",
    evaluation_board: "FGV",
    year: "2023",
    option_1: "O procedimento é inconstitucional, pois exige aprovação prévia do Congresso.",
    option_2: "O estado de defesa não exige manifestação do Congresso Nacional.",
    option_3: "Só poderia vigorar após decreto legislativo do Congresso Nacional.",
    option_4: "O procedimento usado é constitucionalmente correto, pois não exige aprovação prévia.",
    option_5: nil,
    correct_answer: 4,
    available: true,
    law_area: law_areas["Direito Constitucional"],
    question_type: 1
  },
  {
    title: "Explique o princípio da dignidade da pessoa humana na Constituição de 1988.",
    evaluation_board: "VUNESP",
    year: "2022",
    option_1: nil,
    option_2: nil,
    option_3: nil,
    option_4: nil,
    option_5: nil,
    correct_answer: nil,
    available: true,
    law_area: law_areas["Direito Constitucional"],
    question_type: 2,
    standard_answers: [
      {
        text: <<~TEXT.strip,
          O princípio da dignidade da pessoa humana está previsto no artigo 1º, inciso III, da Constituição Federal de 1988, sendo um dos fundamentos da República. Ele assegura respeito absoluto à pessoa, norteando todo o ordenamento jurídico e fundamentando os direitos fundamentais.
        TEXT
        is_active: true
      }
    ]
  },
  {
    title: "No ano anterior à realização de eleições para cargos eletivos federais e estaduais, os dirigentes dos partidos políticos Alfa e Gama iniciaram tratativas para se aliançarem, tanto nas eleições majoritárias como nas proporcionais. Após consultarem a legislação de regência, concluíram corretamente que deveriam formar:",
    evaluation_board: "FGV",
    year: "2023",
    option_1: "Coligação, que se extinguirá ao fim do prazo para o ajuizamento da ação de impugnação de mandato eletivo.",
    option_2: "Gestão colegiada, somente utilizada nas eleições proporcionais, que deve perdurar até o fim do prazo do mandato eletivo obtido.",
    option_3: "Ajuntamento partidário, que se extinguirá após a diplomação dos eleitos.",
    option_4: "Federação, sendo que os partidos devem permanecer filiados por no mínimo quatro anos, contados da data do respectivo ingresso.",
    option_5: nil,
    correct_answer: 4,
    available: true,
    question_type: 1,
    law_area: law_areas["Direito Eleitoral"]
  },
  {
    title: "Francisco é caseiro desde 2019 em uma chácara urbana alugada por temporada. Ele limpa a casa, recebe locatários e realiza manutenção, mesmo sem ocupação. Qual a sua categoria profissional?",
    evaluation_board: "FGV",
    year: "2023",
    option_1: "Trabalhador intermitente",
    option_2: "Empregado doméstico",
    option_3: "Empregado rural",
    option_4: "Empregado comum",
    option_5: nil,
    correct_answer: 4,
    available: true,
    question_type: 1,
    law_area: law_areas["Direito do Trabalho"]
  },
  {
    title: "Bruno dirigia corretamente quando colidiu com André, que estava alcoolizado. André morreu por eletrocussão após o acidente. Bruno fugiu sem comunicar. Qual a responsabilização penal correta?",
    evaluation_board: "FGV",
    year: "2023",
    option_1: "Deverá ser penalmente responsabilizado por omissão de socorro (Art. 304 do CTB), pois a morte foi causada por culpa exclusiva da vítima.",
    option_2: "Não praticou crime, pois concausa independente afasta homicídio culposo e emoção afasta omissão de socorro.",
    option_3: "Homicídio culposo com causa de aumento por omissão de socorro.",
    option_4: "Homicídio culposo e omissão de socorro, em concurso material.",
    option_5: nil,
    correct_answer: 1,
    available: true,
    question_type: 1,
    law_area: law_areas["Direito Penal"]
  },
  {
    title: "Projeto de lei ambiental tramita na Câmara Municipal de Alfa e está harmônico com normas estaduais e federais. Segundo a CRFB/88, é correto afirmar que:",
    evaluation_board: "FGV",
    year: "2023",
    option_1: "Ofende a CF, pois a União legisla com exclusividade sobre proteção ao meio ambiente.",
    option_2: "É incompatível com a CF, pois apenas União, Estados e DF podem legislar sobre meio ambiente.",
    option_3: "É compatível com a CF, pois o Município tem competência suplementar no interesse local.",
    option_4: "Não afronta a CF, pois o Município tem competência concorrente e pode legislar diferentemente dos demais entes.",
    option_5: nil,
    correct_answer: 3,
    available: true,
    question_type: 1,
    law_area: law_areas["Direito Ambiental"]
  },
  {
    title: "Pierre Renoir, cidadão francês domiciliado em Portugal, faleceu e deixou imóvel no Brasil. Qual lei rege a sucessão?",
    evaluation_board: "FGV",
    year: "2023",
    option_1: "Francesa",
    option_2: "Portuguesa",
    option_3: "Brasileira",
    option_4: "Alemã",
    option_5: nil,
    correct_answer: 2,
    available: true,
    question_type: 1,
    law_area: law_areas["Direito Civil"]
  },
  {
    title: "A empresa Aguardente 100% Ltda. protocolou consulta sobre IPI antes do vencimento do tributo. Ainda pendente de resposta, o que diz o CTN?",
    evaluation_board: "FGV",
    year: "2023",
    option_1: "Juros de mora são exigíveis mesmo com a consulta em andamento.",
    option_2: "O Fisco pode aplicar multa se a decisão da consulta for contrária à empresa.",
    option_3: "Não podem ser aplicados juros nem multa durante a pendência da consulta.",
    option_4: "O Fisco pode impor garantias legais mesmo durante a consulta.",
    option_5: nil,
    correct_answer: 3,
    available: true,
    question_type: 1,
    law_area: law_areas["Direito Tributário"]
  },
  {
    title: "Josias deseja delegar competência por excesso de trabalho. Januário quer avocar competência de instância inferior por relevância. Segundo a Lei 9.784/99, é correto afirmar que:",
    evaluation_board: "FGV",
    year: "2023",
    option_1: "Josias pode delegar verbalmente por ser servidor de alta hierarquia.",
    option_2: "A delegação feita por Josias não poderá ser revogada.",
    option_3: "Josias só pode delegar para órgão hierarquicamente inferior.",
    option_4: "Januário pode avocar competência em caráter excepcional, se justificado.",
    option_5: nil,
    correct_answer: 4,
    available: true,
    question_type: 1,
    law_area: law_areas["Direito Administrativo"]
  },
  {
    title: "Luciane ajuizou ação penal privada contra Jorge por injúria, mas não o encontrou para citação pessoal. Sabe-se que Jorge está temporariamente em outra cidade. Qual o procedimento correto?",
    evaluation_board: "FGV",
    year: "2023",
    option_1: "Citação por seu chefe de serviço via ofício à Guarda Municipal.",
    option_2: "Citação por hora certa, pois Jorge se ocultou para não ser encontrado.",
    option_3: "Citação por carta precatória para cidade onde reside temporariamente.",
    option_4: "Citação por correspondência com AR no novo endereço.",
    option_5: nil,
    correct_answer: 2,
    available: true,
    question_type: 1,
    law_area: law_areas["Direito Processual Penal"]
  },
  {
    title: "A União publicou edital de licitação, na modalidade concorrência, para obra de infraestrutura de R$300.000.000,00. A empresa Construodetudo S.A. pretende participar, mas tem dúvidas jurídicas. Responda aos questionamentos a seguir.",
    evaluation_board: "FGV",
    year: "2023",
    option_1: "A) O edital em questão deveria contemplar a matriz de alocação de riscos entre contratante e contratado? Justifique. (Valor: 0,65)",
    option_2: "B) É possível exigir do licitante vencedor a implementação de programa de integridade? Justifique. (Valor: 0,60)\nObs.: o(a) examinando(a) deve fundamentar suas respostas. A mera citação do dispositivo legal não confere pontuação.",
    option_3: nil,
    option_4: nil,
    option_5: nil,
    correct_answer: nil,
    available: true,
    question_type: 2,
    law_area: law_areas["Direito Administrativo"],
    standard_answers: [
      {
        text: <<~TEXT.strip,
          A) Sim, a matriz de alocação de riscos é essencial para definir responsabilidades e evitar litígios, conforme orientações da nova Lei de Licitações (Lei nº 14.133/2021).

          B) Sim, a implementação de programa de integridade pode ser exigida para garantir transparência e ética na execução contratual.
        TEXT
        is_active: true
      }
    ]
  },
  {
    title: "A sociedade empresária Alfa foi contratada pelo Estado Beta para prestar serviços de TI sob a nova Lei de Licitações. Durante a execução, o Estado atrasou por 80 dias o pagamento de notas fiscais de serviços já prestados. O contrato não prevê cláusula arbitral. O sócio da empresa procura seu auxílio jurídico para buscar a extinção do contrato. Responda:",
    evaluation_board: "FGV",
    year: "2023",
    option_1: "A) A contratada tem direito à extinção do contrato? Justifique. (Valor: 0,65)",
    option_2: "B) Caso haja a extinção do contrato em decorrência de culpa exclusiva do Estado Beta, quais os direitos do contratado? Justifique. (Valor: 0,60)\nObs.: o(a) examinando(a) deve fundamentar suas respostas. A mera citação do dispositivo legal não confere pontuação.",
    option_3: nil,
    option_4: nil,
    option_5: nil,
    correct_answer: nil,
    available: true,
    question_type: 2,
    law_area: law_areas["Direito Administrativo"],
    standard_answers: [
      {
        text: <<~TEXT.strip,
          A) Sim. Conforme art. 137, inciso III, da Lei nº 14.133/2021, o contratado pode pleitear a extinção do contrato em caso de inadimplência da Administração superior a 60 dias.

          B) Na hipótese de rescisão por culpa exclusiva da Administração, o contratado tem direito à indenização por prejuízos comprovados, incluindo lucros cessantes, e ao pagamento pelos serviços prestados.
        TEXT
        is_active: true
      }
    ]
  }, 
  {
    title: "Após realizar pedido administrativo para a concessão de determinado benefício, a sociedade empresária Incrível teve o seu pedido parcialmente deferido pelo órgão com atribuição da Administração Pública Federal. Em razão disso, apresentou o recurso administrativo X para a obtenção do deferimento integral do pleiteado. O recurso X não foi conhecido pela autoridade competente, porque foi apresentado fora do prazo legal. Ocorre que, ao analisar a situação impugnada, a referida autoridade competente, de ofício, entendeu que a parcela que havia sido deferida continha vício insanável, de modo que, na mesma decisão que não conheceu do recurso – sem que tenha havido preclusão, portanto – realizou a notificação da sociedade empresária Incrível para se manifestar sobre a ilegalidade verificada, que pode ensejar a anulação daquilo que havia sido concedido, fato que importaria em gravame para a sociedade Incrível. Considerando os dados apresentados e que não há legislação acerca do aludido procedimento administrativo específico, responda, fundamentadamente, aos questionamentos abaixo.",
    evaluation_board: "FGV",
    year: "2023",
    option_1: "A) Qual o prazo para a interposição do recurso administrativo X em questão? Justifique. (Valor: 0,60)",
    option_2: "B) O não conhecimento do recurso X impede que a Administração reveja, de ofício, eventual ilegalidade constatada na parte em que o pedido da sociedade empresária Incrível foi deferido? (Valor: 0,65)",
    option_3: nil,
    option_4: nil,
    option_5: nil,
    correct_answer: nil,
    available: true,
    question_type: 2,
    law_area: law_areas["Direito Administrativo"],
    standard_answers: [
      {
        text: <<~TEXT.strip,
          A) O prazo para a interposição do recurso administrativo, nos termos do art. 59 da Lei nº 9.784/1999, é de 10 (dez) dias, salvo disposição legal específica que estabeleça prazo diverso.

          B) Não. Conforme o art. 53 da Lei nº 9.784/1999, a Administração tem o dever de anular seus próprios atos quando eivados de vícios que os tornem ilegais, mesmo de ofício, respeitados o contraditório e a ampla defesa, como no caso narrado, em que foi oportunizada manifestação da interessada.
        TEXT
        is_active: true
      }
    ]
  },
  {
    title: "Jaqueline é servidora pública ocupante de cargo efetivo em determinado Tribunal Regional Federal e atualmente é a responsável pelo controle interno do Tribunal. No exercício de suas funções, Jaqueline tomou conhecimento de ilegalidade, consistente em fraude em contrato administrativo celebrado pelo Tribunal com determinada sociedade empresária, que causou dano ao erário no valor de R$ 600.000,00 (seiscentos mil reais). No entanto, mesmo não tendo qualquer participação no ilícito, Jaqueline preferiu quedar-se omissa e sequer deu ciência da ilegalidade ao Tribunal de Contas da União. No caso em tela, em matéria de controle da Administração Pública, com base no texto da Constituição Federal, responda às perguntas a seguir.",
    evaluation_board: "FGV",
    year: "2023",
    option_1: "A) Jaqueline, como agente público responsável pelo controle interno, pode ser responsabilizada por sua omissão? Justifique. (Valor: 0,65)",
    option_2: "B) Quem possui legitimidade para denunciar, perante o Tribunal de Contas da União, ilegalidade como a narrada acima? Justifique. (Valor: 0,60)",
    option_3: nil,
    option_4: nil,
    option_5: nil,
    correct_answer: nil,
    available: true,
    question_type: 2,
    law_area: law_areas["Direito Administrativo"],
    standard_answers: [
      {
        text: <<~TEXT.strip,
          A) Sim. Nos termos do art. 74, §1º, da Constituição Federal, os responsáveis pelo controle interno, ao tomarem conhecimento de irregularidades ou ilegalidades, têm o dever de dar ciência ao Tribunal de Contas da União, sob pena de responsabilidade solidária.

          B) Qualquer cidadão, partido político, associação ou sindicato tem legitimidade para denunciar irregularidades perante o Tribunal de Contas da União, conforme previsto no art. 74, §2º, da Constituição Federal.
        TEXT
        is_active: true
      }
    ]
  }, 
  {
    title: "Em fevereiro de 2022, o Ministério Público ajuizou ação por improbidade administrativa em face de Rômulo, agente público municipal, e da sociedade empresária Boazinha Ltda., na forma do Art. 10, inciso VIII, da Lei nº 8.429/92, em decorrência de fraude em procedimento licitatório. O processo transcorreu sem vícios perante o Juízo da 1ª Vara de Fazenda Pública da Comarca da Capital do estado Alfa, sendo certo que o juiz entendeu pela caracterização do ato de improbidade doloso imputado aos demandados pelo parquet. Em razão disso, o magistrado condenou ambos os réus e determinou que a sociedade empresária Boazinha Ltda. promovesse o ressarcimento ao erário, bem como aplicou a penalidade de multa correspondente a dez vezes o valor do dano e proibição de contratar com a Administração Pública Direta e Indireta ou de receber benefícios fiscais, por tempo indeterminado. Os embargos de declaração opostos à sentença foram rejeitados por decisão publicada na última sexta-feira. Em decorrência de tais fatos, os representantes da sociedade empresária Boazinha procuram a sua assessoria jurídica para adotar as providências necessárias para impugnar as penalidades determinadas pelo Juízo de primeiro grau, informando, ainda, o seguinte:\n\n– Antes da prolação da sentença, pelos mesmos fatos da ação em comento, a sociedade empresária Boazinha Ltda. formalizou e cumpriu acordo de leniência, com as autoridades competentes, com fulcro na Lei nº 12.846/13, que estabeleceu o ressarcimento ao erário, resultou na isenção das penalidades previstas na Lei nº 12.846/13 e reduziu a multa em 2/3 (dois terços). O aludido acordo foi comunicado ao Juízo no bojo da ação de improbidade administrativa, que intimou as partes interessadas e o Ministério Público, sendo certo que todos se reportaram às suas falas.\n\n– A sociedade sobrevive dos contratos formalizados com a Administração Pública, de modo que as penas impostas importariam em efeitos econômicos e sociais gravíssimos.\n\nDiante das circunstâncias narradas, redija a peça cabível, mediante a apresentação de todos os fundamentos jurídicos pertinentes, à luz do que foi informado pela sociedade.",
    evaluation_board: "FGV",
    year: "2023",
    option_1: nil,
    option_2: nil,
    option_3: nil,
    option_4: nil,
    option_5: nil,
    correct_answer: nil,
    available: true,
    question_type: 3,
    law_area: law_areas["Direito Administrativo"],
    standard_answers: [
      {
        text: <<~TEXT.strip,
          A peça cabível é a apelação, conforme o art. 1.009 do CPC. O recurso deverá ser fundamentado com base na superveniência do acordo de leniência celebrado pela empresa com fundamento na Lei nº 12.846/2013. Isso implica a impossibilidade de aplicação cumulativa das penalidades previstas na Lei de Improbidade Administrativa. Além disso, deve-se demonstrar a desproporcionalidade da sanção imposta, em razão da atividade econômica da empresa depender de contratos públicos.
        TEXT
        is_active: true
      }
    ]
  }
]

created_questions = questions.map do |question_attrs|
  std_answers_attrs = question_attrs.delete(:standard_answers)

  question = Question.find_or_create_by!(title: question_attrs[:title]) do |q|
    q.assign_attributes(question_attrs)
  end

  if std_answers_attrs.present?
    std_answers_attrs.each do |sa_attrs|
      StandardAnswer.find_or_create_by!(question: question, text: sa_attrs[:text]) do |sa|
        sa.is_active = sa_attrs[:is_active]
      end
    end
  end

  question
end

puts "🌱 Seed finalizado com sucesso!"
