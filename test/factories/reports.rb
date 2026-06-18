FactoryBot.define do
  factory :report do
    company_name { Faker::Company.name }
    company_domain { Faker::Internet.unique.domain_name }
    osint_findings do
      {
        id: company_domain.gsub(".", "_"),
        company: {
          name: company_name,
          domain: company_domain,
          verified: Faker::Boolean.boolean,
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
            score: "#{Faker::Number.between(from: 3, to: 5)} / 5",
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
            { label: "Customer service", sentiment: %w[positive negative].sample },
            { label: "Product quality", sentiment: %w[positive negative].sample },
            { label: "Shipping", sentiment: %w[positive negative].sample }
          ]
        },
        digitalPresence: {
          website: {
            score: Faker::Number.between(from: 70, to: 98),
            checks: [
              { label: "SSL Certificate", passed: Faker::Boolean.boolean },
              { label: "Domain age", passed: Faker::Boolean.boolean },
              { label: "Mobile friendly", passed: Faker::Boolean.boolean }
            ]
          },
          social: {
            score: Faker::Number.between(from: 60, to: 95),
            platforms: [
              { name: "Instagram", followers: "#{Faker::Number.between(from: 1000, to: 10000)} followers" },
              { name: "Facebook", followers: "#{Faker::Number.between(from: 1000, to: 10000)} followers" }
            ]
          }
        },
        alerts: [
          {
            id: "alert1",
            label: Faker::Company.bs,
            status: %w[success warning error].sample
          }
        ],
        industryComparison: [
          {
            metric: "Reputation",
            company: Faker::Number.between(from: 70, to: 95),
            industryAverage: Faker::Number.between(from: 60, to: 80),
            topTen: Faker::Number.between(from: 85, to: 98)
          }
        ]
      }
    end
  end
end
