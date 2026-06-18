# app/jobs/generate_report_job.rb
class GenerateReportJob < ApplicationJob
  queue_as :default

  def perform(domain)
    company_name = Faker::Company.name

    report = Report.create!(
      company_name: company_name,
      company_domain: domain,
      osint_findings: {
        id: domain.gsub(/[.-]/, "." => "_", "-" => "_"),
        company: {
          name: company_name,
          domain: domain,
          verified: [ true, false ].sample,
          description: Faker::Company.catch_phrase,
          logoText: company_name.split.first,
          tags: [
            { id: "tag1", label: Faker::Commerce.department, icon: "icon1" },
            { id: "tag2", label: Faker::Commerce.department, icon: "icon2" }
          ]
        },
        analyzedAt: Faker::Time.backward(days: 30).strftime("%d de %B, %Y • %I:%M %p"),
        overallScore: Faker::Number.between(from: 50, to: 98),
        overallLevel: %w[excellent good average poor].sample,
        signalsCount: Faker::Number.between(from: 100, to: 5000),
        metrics: [
          {
            id: "reviews",
            label: "Reviews",
            score: "#{Faker::Number.between(from: 3.0, to: 5.0).round(1)} / 5",
            level: %w[excellent good average].sample,
            icon: "reviews"
          },
          {
            id: "website",
            label: "Sitio Web",
            score: "#{Faker::Number.between(from: 70, to: 98)} / 100",
            level: %w[excellent good average].sample,
            icon: "website"
          }
        ],
        aiSummary: {
          headline: Faker::Company.bs,
          positives: Array.new(3) { Faker::Company.bs },
          negatives: Array.new(2) { Faker::Company.bs },
          trustMessage: Faker::Company.catch_phrase
        },
        reviews: {
          total: Faker::Number.between(from: 100, to: 5000),
          distribution: [
            { stars: 5, percentage: Faker::Number.between(from: 40, to: 80) },
            { stars: 4, percentage: Faker::Number.between(from: 10, to: 30) },
            { stars: 3, percentage: Faker::Number.between(from: 5, to: 15) },
            { stars: 2, percentage: Faker::Number.between(from: 2, to: 10) },
            { stars: 1, percentage: Faker::Number.between(from: 1, to: 5) }
          ],
          topics: [
            { label: "Atención al cliente", sentiment: %w[positive negative].sample },
            { label: "Calidad de productos", sentiment: %w[positive negative].sample },
            { label: "Tiempos de envío", sentiment: %w[positive negative].sample }
          ]
        },
        digitalPresence: {
          website: {
            score: Faker::Number.between(from: 70, to: 98),
            checks: [
              { label: "Certificado SSL activo", passed: [ true, false ].sample },
              { label: "Dominio con más de 10 años", passed: [ true, false ].sample },
              { label: "Velocidad de carga óptima", passed: [ true, false ].sample },
              { label: "Diseño mobile-friendly", passed: [ true, false ].sample }
            ]
          },
          social: {
            score: Faker::Number.between(from: 60, to: 95),
            platforms: [
              { name: "Instagram", followers: "#{Faker::Number.between(from: 1000, to: 10000000)} seguidores" },
              { name: "Facebook", followers: "#{Faker::Number.between(from: 1000, to: 10000000)} seguidores" },
              { name: "TikTok", followers: "#{Faker::Number.between(from: 1000, to: 10000000)} seguidores" }
            ]
          }
        },
        alerts: [
          {
            id: "alert1",
            label: Faker::Company.bs,
            status: %w[success warning error].sample
          },
          {
            id: "alert2",
            label: Faker::Company.bs,
            status: %w[success warning error].sample
          }
        ],
        industryComparison: [
          {
            metric: "Reputación General",
            company: Faker::Number.between(from: 70, to: 95),
            industryAverage: Faker::Number.between(from: 60, to: 80),
            topTen: Faker::Number.between(from: 85, to: 98)
          },
          {
            metric: "Reviews",
            company: Faker::Number.between(from: 70, to: 95),
            industryAverage: Faker::Number.between(from: 60, to: 80),
            topTen: Faker::Number.between(from: 85, to: 98)
          }
        ]
      }
    )

    report
  end
end
