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
    question_type: 1 # objetiva
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
    question_type: 2 # discursiva
  }
]

created_questions = questions.map do |question|
  Question.find_or_create_by!(title: question[:title]) do |question|
    question.assign_attributes(question)
  end
end

puts "✅ Criando resposta padrão para questão discursiva..."

discursive_question = created_questions.find { |question| question.question_type == 2 }

StandardAnswer.find_or_create_by!(question: discursive_question) do |standard_answer|
  standard_answer.text = "O princípio da dignidade da pessoa humana é um dos fundamentos da República e garante a proteção da integridade física, psíquica e moral do indivíduo."
  standard_answer.is_active = true
end

puts "🌱 Seed finalizado com sucesso!"