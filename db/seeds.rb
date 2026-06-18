# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
puts "Cleaning reports..."
Report.destroy_all

puts "Creating reports..."

reports_data = [
  {
    company_name: "Zara",
    company_domain: "zara.com",
    osint_findings: {
      id: "zara",
      company: {
        name: "Zara",
        domain: "zara.com",
        verified: true,
        description: "Tienda de moda internacional con presencia en más de 90 países.",
        logoText: "ZARA",
        tags: [
          { id: "moda", label: "Moda", icon: "fashion" },
          { id: "retail", label: "Retail", icon: "retail" },
          { id: "global", label: "Global", icon: "global" }
        ]
      },
      analyzedAt: "20 de mayo, 2024 • 10:32 AM",
      overallScore: 87,
      overallLevel: "excellent",
      signalsCount: 2347,
      metrics: [
        { id: "reviews", label: "Reviews", score: "4.7 / 5", level: "excellent", icon: "reviews" },
        { id: "website", label: "Sitio Web", score: "92 / 100", level: "excellent", icon: "website" },
        { id: "social", label: "Redes Sociales", score: "84 / 100", level: "good", icon: "social" },
        { id: "security", label: "Seguridad", score: "95 / 100", level: "excellent", icon: "security" },
        { id: "seo", label: "SEO", score: "81 / 100", level: "good", icon: "seo" },
        { id: "reputation", label: "Reputación General", score: "89 / 100", level: "excellent", icon: "reputation" }
      ],
      aiSummary: {
        headline: "Esta empresa presenta una reputación sólida en internet.",
        positives: [
          "Calidad de productos y diseño de moda",
          "Amplia presencia internacional",
          "Buena experiencia en tienda física"
        ],
        negatives: [
          "Tiempos de envío en temporada alta",
          "Políticas de devolución poco claras",
          "Atención al cliente saturada en picos"
        ],
        trustMessage: "Con alta probabilidad, este negocio es confiable y seguro para realizar compras."
      },
      reputationEvolution: {
        growthPoints: 15,
        data: [
          { year: "2022", score: 72 },
          { year: "2023", score: 78 },
          { year: "2024", score: 82 },
          { year: "2025", score: 85 },
          { year: "2026", score: 87 }
        ]
      },
      reviews: {
        total: 2347,
        distribution: [
          { stars: 5, percentage: 68 },
          { stars: 4, percentage: 19 },
          { stars: 3, percentage: 7 },
          { stars: 2, percentage: 4 },
          { stars: 1, percentage: 2 }
        ],
        topics: [
          { label: "Atención al cliente", sentiment: "positive" },
          { label: "Calidad de productos", sentiment: "positive" },
          { label: "Tiempos de envío", sentiment: "negative" },
          { label: "Política de devoluciones", sentiment: "negative" },
          { label: "Precios competitivos", sentiment: "positive" },
          { label: "Tallas y ajuste", sentiment: "negative" }
        ]
      },
      digitalPresence: {
        website: {
          score: 92,
          checks: [
            { label: "Certificado SSL activo", passed: true },
            { label: "Dominio con más de 10 años", passed: true },
            { label: "Velocidad de carga óptima", passed: true },
            { label: "Diseño mobile-friendly", passed: true }
          ]
        },
        social: {
          score: 84,
          platforms: [
            { name: "Instagram", followers: "8.2M seguidores" },
            { name: "Facebook", followers: "5.1M seguidores" },
            { name: "TikTok", followers: "2.4M seguidores" },
            { name: "YouTube", followers: "1.1M suscriptores" },
            { name: "LinkedIn", followers: "890K seguidores" }
          ]
        }
      },
      alerts: [
        { id: "lawsuits", label: "Sin demandas relevantes detectadas", status: "success" },
        { id: "negative-reviews", label: "Incremento de reseñas negativas en los últimos 30 días", status: "warning", detail: "+18% respecto al mes anterior" },
        { id: "domain-age", label: "Dominio registrado hace más de 15 años", status: "success" },
        { id: "phishing", label: "Sin señales de phishing o suplantación", status: "success" }
      ],
      industryComparison: [
        { metric: "Reputación General", company: 89, industryAverage: 74, topTen: 92 },
        { metric: "Reviews", company: 94, industryAverage: 78, topTen: 96 },
        { metric: "Sitio Web", company: 92, industryAverage: 81, topTen: 95 },
        { metric: "Redes Sociales", company: 84, industryAverage: 72, topTen: 90 },
        { metric: "Seguridad", company: 95, industryAverage: 85, topTen: 98 },
        { metric: "SEO", company: 81, industryAverage: 70, topTen: 88 }
      ]
    }
  },
  {
    company_name: "Apple",
    company_domain: "apple.com",
    osint_findings: {
      id: "apple",
      company: {
        name: "Apple",
        domain: "apple.com",
        verified: true,
        description: "Empresa de tecnología y electrónica de consumo.",
        logoText: "APPLE",
        tags: [
          { id: "tecnologia", label: "Tecnología", icon: "tech" },
          { id: "innovacion", label: "Innovación", icon: "innovation" }
        ]
      },
      analyzedAt: "15 de junio, 2024 • 2:15 PM",
      overallScore: 95,
      overallLevel: "excellent",
      signalsCount: 18923,
      metrics: [
        { id: "reviews", label: "Reviews", score: "4.8 / 5", level: "excellent", icon: "reviews" },
        { id: "website", label: "Sitio Web", score: "96 / 100", level: "excellent", icon: "website" },
        { id: "social", label: "Redes Sociales", score: "91 / 100", level: "excellent", icon: "social" },
        { id: "security", label: "Seguridad", score: "98 / 100", level: "excellent", icon: "security" },
        { id: "seo", label: "SEO", score: "88 / 100", level: "good", icon: "seo" },
        { id: "reputation", label: "Reputación General", score: "95 / 100", level: "excellent", icon: "reputation" }
      ],
      aiSummary: {
        headline: "Líder mundial en tecnología con excelente reputación.",
        positives: [
          "Calidad de productos superior",
          "Innovación constante",
          "Ecosistema integrado"
        ],
        negatives: [
          "Precios elevados",
          "Reparaciones costosas",
          "Obsolescencia programada"
        ],
        trustMessage: "Marca altamente confiable y reconocida globalmente."
      },
      reputationEvolution: {
        growthPoints: 12,
        data: [
          { year: "2022", score: 88 },
          { year: "2023", score: 91 },
          { year: "2024", score: 93 },
          { year: "2025", score: 94 },
          { year: "2026", score: 95 }
        ]
      },
      reviews: {
        total: 18923,
        distribution: [
          { stars: 5, percentage: 72 },
          { stars: 4, percentage: 18 },
          { stars: 3, percentage: 6 },
          { stars: 2, percentage: 3 },
          { stars: 1, percentage: 1 }
        ],
        topics: [
          { label: "Calidad del producto", sentiment: "positive" },
          { label: "Servicio al cliente", sentiment: "negative" },
          { label: "Innovación", sentiment: "positive" },
          { label: "Precios", sentiment: "negative" }
        ]
      },
      digitalPresence: {
        website: {
          score: 96,
          checks: [
            { label: "Certificado SSL activo", passed: true },
            { label: "Dominio con más de 10 años", passed: true },
            { label: "Velocidad de carga óptima", passed: true },
            { label: "Diseño mobile-friendly", passed: true }
          ]
        },
        social: {
          score: 91,
          platforms: [
            { name: "Instagram", followers: "35M seguidores" },
            { name: "Facebook", followers: "28M seguidores" },
            { name: "Twitter", followers: "22M seguidores" },
            { name: "YouTube", followers: "15M suscriptores" }
          ]
        }
      },
      alerts: [
        { id: "lawsuits", label: "Demanda antimonopolio en curso", status: "warning", detail: "Caso en la UE" },
        { id: "privacy", label: "Buenas prácticas de privacidad", status: "success" },
        { id: "supply-chain", label: "Problemas en cadena de suministro", status: "warning" }
      ],
      industryComparison: [
        { metric: "Reputación General", company: 95, industryAverage: 76, topTen: 93 },
        { metric: "Reviews", company: 96, industryAverage: 79, topTen: 95 },
        { metric: "Sitio Web", company: 96, industryAverage: 82, topTen: 97 },
        { metric: "Redes Sociales", company: 91, industryAverage: 73, topTen: 92 },
        { metric: "Seguridad", company: 98, industryAverage: 84, topTen: 99 },
        { metric: "SEO", company: 88, industryAverage: 71, topTen: 90 }
      ]
    }
  },
  {
    company_name: "Google",
    company_domain: "google.com",
    osint_findings: {
      id: "google",
      company: {
        name: "Google",
        domain: "google.com",
        verified: true,
        description: "Motor de búsqueda y servicios tecnológicos.",
        logoText: "GOOGLE",
        tags: [
          { id: "tecnologia", label: "Tecnología", icon: "tech" },
          { id: "busqueda", label: "Búsqueda", icon: "search" }
        ]
      },
      analyzedAt: "10 de marzo, 2024 • 9:00 AM",
      overallScore: 98,
      overallLevel: "excellent",
      signalsCount: 45231,
      metrics: [
        { id: "reviews", label: "Reviews", score: "4.9 / 5", level: "excellent", icon: "reviews" },
        { id: "website", label: "Sitio Web", score: "99 / 100", level: "excellent", icon: "website" },
        { id: "social", label: "Redes Sociales", score: "88 / 100", level: "good", icon: "social" },
        { id: "security", label: "Seguridad", score: "97 / 100", level: "excellent", icon: "security" },
        { id: "seo", label: "SEO", score: "100 / 100", level: "excellent", icon: "seo" },
        { id: "reputation", label: "Reputación General", score: "96 / 100", level: "excellent", icon: "reputation" }
      ],
      aiSummary: {
        headline: "Líder indiscutible en búsqueda y tecnología.",
        positives: [
          "Servicios gratuitos de calidad",
          "Innovación constante",
          "Integración entre productos"
        ],
        negatives: [
          "Preocupaciones de privacidad",
          "Posición dominante en el mercado",
          "Recolección de datos"
        ],
        trustMessage: "Plataforma confiable con servicios esenciales."
      },
      reputationEvolution: {
        growthPoints: 8,
        data: [
          { year: "2022", score: 92 },
          { year: "2023", score: 94 },
          { year: "2024", score: 96 },
          { year: "2025", score: 97 },
          { year: "2026", score: 98 }
        ]
      },
      reviews: {
        total: 45231,
        distribution: [
          { stars: 5, percentage: 78 },
          { stars: 4, percentage: 15 },
          { stars: 3, percentage: 4 },
          { stars: 2, percentage: 2 },
          { stars: 1, percentage: 1 }
        ],
        topics: [
          { label: "Facilidad de uso", sentiment: "positive" },
          { label: "Privacidad", sentiment: "negative" },
          { label: "Velocidad", sentiment: "positive" },
          { label: "Publicidad", sentiment: "negative" }
        ]
      },
      digitalPresence: {
        website: {
          score: 99,
          checks: [
            { label: "Certificado SSL activo", passed: true },
            { label: "Dominio con más de 10 años", passed: true },
            { label: "Velocidad de carga óptima", passed: true },
            { label: "Diseño mobile-friendly", passed: true }
          ]
        },
        social: {
          score: 88,
          platforms: [
            { name: "Instagram", followers: "28M seguidores" },
            { name: "Facebook", followers: "32M seguidores" },
            { name: "Twitter", followers: "26M seguidores" },
            { name: "YouTube", followers: "42M suscriptores" }
          ]
        }
      },
      alerts: [
        { id: "privacy", label: "Investigación de privacidad en curso", status: "warning", detail: "UE y EEUU" },
        { id: "monopoly", label: "Demanda antimonopolio", status: "warning" },
        { id: "security", label: "Seguridad de datos robusta", status: "success" }
      ],
      industryComparison: [
        { metric: "Reputación General", company: 96, industryAverage: 76, topTen: 94 },
        { metric: "Reviews", company: 98, industryAverage: 79, topTen: 97 },
        { metric: "Sitio Web", company: 99, industryAverage: 82, topTen: 98 },
        { metric: "Redes Sociales", company: 88, industryAverage: 73, topTen: 91 },
        { metric: "Seguridad", company: 97, industryAverage: 84, topTen: 98 },
        { metric: "SEO", company: 100, industryAverage: 71, topTen: 99 }
      ]
    }
  },
  {
    company_name: "Amazon",
    company_domain: "amazon.com",
    osint_findings: {
      id: "amazon",
      company: {
        name: "Amazon",
        domain: "amazon.com",
        verified: true,
        description: "Comercio electrónico y servicios en la nube.",
        logoText: "AMAZON",
        tags: [
          { id: "ecommerce", label: "E-commerce", icon: "shopping" },
          { id: "cloud", label: "Cloud", icon: "cloud" }
        ]
      },
      analyzedAt: "5 de abril, 2024 • 3:45 PM",
      overallScore: 92,
      overallLevel: "excellent",
      signalsCount: 67812,
      metrics: [
        { id: "reviews", label: "Reviews", score: "4.5 / 5", level: "good", icon: "reviews" },
        { id: "website", label: "Sitio Web", score: "94 / 100", level: "excellent", icon: "website" },
        { id: "social", label: "Redes Sociales", score: "82 / 100", level: "good", icon: "social" },
        { id: "security", label: "Seguridad", score: "93 / 100", level: "excellent", icon: "security" },
        { id: "seo", label: "SEO", score: "95 / 100", level: "excellent", icon: "seo" },
        { id: "reputation", label: "Reputación General", score: "90 / 100", level: "excellent", icon: "reputation" }
      ],
      aiSummary: {
        headline: "Gigante del comercio con opiniones mixtas.",
        positives: [
          "Entrega rápida",
          "Variedad de productos",
          "Precios competitivos"
        ],
        negatives: [
          "Condiciones laborales",
          "Productos falsificados",
          "Impacto ambiental"
        ],
        trustMessage: "Plataforma confiable con algunas áreas a mejorar."
      },
      reputationEvolution: {
        growthPoints: 10,
        data: [
          { year: "2022", score: 85 },
          { year: "2023", score: 88 },
          { year: "2024", score: 90 },
          { year: "2025", score: 91 },
          { year: "2026", score: 92 }
        ]
      },
      reviews: {
        total: 67812,
        distribution: [
          { stars: 5, percentage: 58 },
          { stars: 4, percentage: 25 },
          { stars: 3, percentage: 10 },
          { stars: 2, percentage: 5 },
          { stars: 1, percentage: 2 }
        ],
        topics: [
          { label: "Entrega", sentiment: "positive" },
          { label: "Calidad de productos", sentiment: "negative" },
          { label: "Precios", sentiment: "positive" },
          { label: "Servicio al cliente", sentiment: "negative" }
        ]
      },
      digitalPresence: {
        website: {
          score: 94,
          checks: [
            { label: "Certificado SSL activo", passed: true },
            { label: "Dominio con más de 10 años", passed: true },
            { label: "Velocidad de carga óptima", passed: true },
            { label: "Diseño mobile-friendly", passed: true }
          ]
        },
        social: {
          score: 82,
          platforms: [
            { name: "Instagram", followers: "18M seguidores" },
            { name: "Facebook", followers: "25M seguidores" },
            { name: "Twitter", followers: "12M seguidores" }
          ]
        }
      },
      alerts: [
        { id: "labor", label: "Problemas laborales reportados", status: "warning", detail: "Huelgas en varios países" },
        { id: "fake-products", label: "Quejas por productos falsificados", status: "warning" },
        { id: "tax-evasion", label: "Investigación fiscal", status: "warning" }
      ],
      industryComparison: [
        { metric: "Reputación General", company: 90, industryAverage: 76, topTen: 92 },
        { metric: "Reviews", company: 90, industryAverage: 79, topTen: 93 },
        { metric: "Sitio Web", company: 94, industryAverage: 82, topTen: 96 },
        { metric: "Redes Sociales", company: 82, industryAverage: 73, topTen: 88 },
        { metric: "Seguridad", company: 93, industryAverage: 84, topTen: 95 },
        { metric: "SEO", company: 95, industryAverage: 71, topTen: 97 }
      ]
    }
  },
  {
    company_name: "Microsoft",
    company_domain: "microsoft.com",
    osint_findings: {
      id: "microsoft",
      company: {
        name: "Microsoft",
        domain: "microsoft.com",
        verified: true,
        description: "Software, servicios y tecnología en la nube.",
        logoText: "MICROSOFT",
        tags: [
          { id: "software", label: "Software", icon: "code" },
          { id: "cloud", label: "Cloud", icon: "cloud" }
        ]
      },
      analyzedAt: "18 de julio, 2024 • 11:20 AM",
      overallScore: 94,
      overallLevel: "excellent",
      signalsCount: 34521,
      metrics: [
        { id: "reviews", label: "Reviews", score: "4.6 / 5", level: "excellent", icon: "reviews" },
        { id: "website", label: "Sitio Web", score: "95 / 100", level: "excellent", icon: "website" },
        { id: "social", label: "Redes Sociales", score: "86 / 100", level: "good", icon: "social" },
        { id: "security", label: "Seguridad", score: "96 / 100", level: "excellent", icon: "security" },
        { id: "seo", label: "SEO", score: "90 / 100", level: "excellent", icon: "seo" },
        { id: "reputation", label: "Reputación General", score: "93 / 100", level: "excellent", icon: "reputation" }
      ],
      aiSummary: {
        headline: "Líder en software empresarial con buena reputación.",
        positives: [
          "Productos empresariales robustos",
          "Nube confiable",
          "Soporte técnico"
        ],
        negatives: [
          "Precios elevados",
          "Curva de aprendizaje",
          "Problemas de compatibilidad"
        ],
        trustMessage: "Marca confiable para empresas y particulares."
      },
      reputationEvolution: {
        growthPoints: 9,
        data: [
          { year: "2022", score: 87 },
          { year: "2023", score: 90 },
          { year: "2024", score: 92 },
          { year: "2025", score: 93 },
          { year: "2026", score: 94 }
        ]
      },
      reviews: {
        total: 34521,
        distribution: [
          { stars: 5, percentage: 65 },
          { stars: 4, percentage: 22 },
          { stars: 3, percentage: 8 },
          { stars: 2, percentage: 3 },
          { stars: 1, percentage: 2 }
        ],
        topics: [
          { label: "Productividad", sentiment: "positive" },
          { label: "Precios", sentiment: "negative" },
          { label: "Integración", sentiment: "positive" },
          { label: "Soporte", sentiment: "negative" }
        ]
      },
      digitalPresence: {
        website: {
          score: 95,
          checks: [
            { label: "Certificado SSL activo", passed: true },
            { label: "Dominio con más de 10 años", passed: true },
            { label: "Velocidad de carga óptima", passed: true },
            { label: "Diseño mobile-friendly", passed: true }
          ]
        },
        social: {
          score: 86,
          platforms: [
            { name: "Instagram", followers: "12M seguidores" },
            { name: "Facebook", followers: "18M seguidores" },
            { name: "Twitter", followers: "15M seguidores" },
            { name: "LinkedIn", followers: "22M seguidores" }
          ]
        }
      },
      alerts: [
        { id: "security", label: "Seguridad robusta", status: "success" },
        { id: "antitrust", label: "Investigación antimonopolio", status: "warning" },
        { id: "backdoor", label: "Sin vulnerabilidades críticas", status: "success" }
      ],
      industryComparison: [
        { metric: "Reputación General", company: 93, industryAverage: 76, topTen: 92 },
        { metric: "Reviews", company: 92, industryAverage: 79, topTen: 94 },
        { metric: "Sitio Web", company: 95, industryAverage: 82, topTen: 97 },
        { metric: "Redes Sociales", company: 86, industryAverage: 73, topTen: 90 },
        { metric: "Seguridad", company: 96, industryAverage: 84, topTen: 98 },
        { metric: "SEO", company: 90, industryAverage: 71, topTen: 93 }
      ]
    }
  },
  {
    company_name: "Nike",
    company_domain: "nike.com",
    osint_findings: {
      id: "nike",
      company: {
        name: "Nike",
        domain: "nike.com",
        verified: true,
        description: "Ropa deportiva y calzado a nivel mundial.",
        logoText: "NIKE",
        tags: [
          { id: "deporte", label: "Deporte", icon: "sports" },
          { id: "moda", label: "Moda", icon: "fashion" }
        ]
      },
      analyzedAt: "25 de agosto, 2024 • 8:30 AM",
      overallScore: 88,
      overallLevel: "good",
      signalsCount: 45678,
      metrics: [
        { id: "reviews", label: "Reviews", score: "4.6 / 5", level: "excellent", icon: "reviews" },
        { id: "website", label: "Sitio Web", score: "89 / 100", level: "good", icon: "website" },
        { id: "social", label: "Redes Sociales", score: "92 / 100", level: "excellent", icon: "social" },
        { id: "security", label: "Seguridad", score: "90 / 100", level: "excellent", icon: "security" },
        { id: "seo", label: "SEO", score: "85 / 100", level: "good", icon: "seo" },
        { id: "reputation", label: "Reputación General", score: "87 / 100", level: "good", icon: "reputation" }
      ],
      aiSummary: {
        headline: "Marca deportiva líder con gran presencia en redes.",
        positives: [
          "Calidad de productos",
          "Marketing efectivo",
          "Innovación en calzado"
        ],
        negatives: [
          "Condiciones laborales en fábricas",
          "Precios elevados",
          "Competencia creciente"
        ],
        trustMessage: "Marca reconocida con productos de calidad."
      },
      reputationEvolution: {
        growthPoints: 7,
        data: [
          { year: "2022", score: 82 },
          { year: "2023", score: 84 },
          { year: "2024", score: 86 },
          { year: "2025", score: 87 },
          { year: "2026", score: 88 }
        ]
      },
      reviews: {
        total: 45678,
        distribution: [
          { stars: 5, percentage: 62 },
          { stars: 4, percentage: 24 },
          { stars: 3, percentage: 8 },
          { stars: 2, percentage: 4 },
          { stars: 1, percentage: 2 }
        ],
        topics: [
          { label: "Calidad", sentiment: "positive" },
          { label: "Precios", sentiment: "negative" },
          { label: "Diseño", sentiment: "positive" },
          { label: "Servicio al cliente", sentiment: "negative" }
        ]
      },
      digitalPresence: {
        website: {
          score: 89,
          checks: [
            { label: "Certificado SSL activo", passed: true },
            { label: "Dominio con más de 10 años", passed: true },
            { label: "Velocidad de carga óptima", passed: true },
            { label: "Diseño mobile-friendly", passed: true }
          ]
        },
        social: {
          score: 92,
          platforms: [
            { name: "Instagram", followers: "45M seguidores" },
            { name: "Facebook", followers: "32M seguidores" },
            { name: "TikTok", followers: "18M seguidores" },
            { name: "YouTube", followers: "8M suscriptores" }
          ]
        }
      },
      alerts: [
        { id: "labor", label: "Condiciones laborales bajo escrutinio", status: "warning", detail: "Fábricas en Asia" },
        { id: "sustainability", label: "Iniciativas de sostenibilidad", status: "success" },
        { id: "counterfeit", label: "Productos falsificados en mercado", status: "warning" }
      ],
      industryComparison: [
        { metric: "Reputación General", company: 87, industryAverage: 74, topTen: 91 },
        { metric: "Reviews", company: 92, industryAverage: 78, topTen: 95 },
        { metric: "Sitio Web", company: 89, industryAverage: 81, topTen: 93 },
        { metric: "Redes Sociales", company: 92, industryAverage: 72, topTen: 94 },
        { metric: "Seguridad", company: 90, industryAverage: 85, topTen: 93 },
        { metric: "SEO", company: 85, industryAverage: 70, topTen: 89 }
      ]
    }
  },
  {
    company_name: "Adidas",
    company_domain: "adidas.com",
    osint_findings: {
      id: "adidas",
      company: {
        name: "Adidas",
        domain: "adidas.com",
        verified: true,
        description: "Ropa deportiva y calzado alemán.",
        logoText: "ADIDAS",
        tags: [
          { id: "deporte", label: "Deporte", icon: "sports" },
          { id: "alemania", label: "Alemania", icon: "germany" }
        ]
      },
      analyzedAt: "2 de septiembre, 2024 • 1:15 PM",
      overallScore: 85,
      overallLevel: "good",
      signalsCount: 34211,
      metrics: [
        { id: "reviews", label: "Reviews", score: "4.4 / 5", level: "good", icon: "reviews" },
        { id: "website", label: "Sitio Web", score: "87 / 100", level: "good", icon: "website" },
        { id: "social", label: "Redes Sociales", score: "89 / 100", level: "good", icon: "social" },
        { id: "security", label: "Seguridad", score: "88 / 100", level: "good", icon: "security" },
        { id: "seo", label: "SEO", score: "83 / 100", level: "good", icon: "seo" },
        { id: "reputation", label: "Reputación General", score: "84 / 100", level: "good", icon: "reputation" }
      ],
      aiSummary: {
        headline: "Marca deportiva alemana con buena reputación.",
        positives: [
          "Calidad en calzado",
          "Diseño innovador",
          "Sostenibilidad"
        ],
        negatives: [
          "Precios altos",
          "Competencia con Nike",
          "Problemas de stock"
        ],
        trustMessage: "Marca confiable con productos de calidad."
      },
      reputationEvolution: {
        growthPoints: 5,
        data: [
          { year: "2022", score: 80 },
          { year: "2023", score: 82 },
          { year: "2024", score: 83 },
          { year: "2025", score: 84 },
          { year: "2026", score: 85 }
        ]
      },
      reviews: {
        total: 34211,
        distribution: [
          { stars: 5, percentage: 58 },
          { stars: 4, percentage: 26 },
          { stars: 3, percentage: 10 },
          { stars: 2, percentage: 4 },
          { stars: 1, percentage: 2 }
        ],
        topics: [
          { label: "Comodidad", sentiment: "positive" },
          { label: "Precios", sentiment: "negative" },
          { label: "Durabilidad", sentiment: "positive" },
          { label: "Tallas", sentiment: "negative" }
        ]
      },
      digitalPresence: {
        website: {
          score: 87,
          checks: [
            { label: "Certificado SSL activo", passed: true },
            { label: "Dominio con más de 10 años", passed: true },
            { label: "Velocidad de carga óptima", passed: true },
            { label: "Diseño mobile-friendly", passed: true }
          ]
        },
        social: {
          score: 89,
          platforms: [
            { name: "Instagram", followers: "28M seguidores" },
            { name: "Facebook", followers: "22M seguidores" },
            { name: "TikTok", followers: "12M seguidores" }
          ]
        }
      },
      alerts: [
        { id: "sustainability", label: "Iniciativas de sostenibilidad", status: "success" },
        { id: "supply-chain", label: "Problemas en cadena de suministro", status: "warning" }
      ],
      industryComparison: [
        { metric: "Reputación General", company: 84, industryAverage: 74, topTen: 91 },
        { metric: "Reviews", company: 88, industryAverage: 78, topTen: 95 },
        { metric: "Sitio Web", company: 87, industryAverage: 81, topTen: 93 },
        { metric: "Redes Sociales", company: 89, industryAverage: 72, topTen: 94 },
        { metric: "Seguridad", company: 88, industryAverage: 85, topTen: 93 },
        { metric: "SEO", company: 83, industryAverage: 70, topTen: 89 }
      ]
    }
  } ]
reports_data.each do |data|
  Report.create!(
    company_name: data[:company_name],
    company_domain: data[:company_domain],
    osint_findings: data[:osint_findings]
  )
end

puts "Created #{Report.count} reports"
