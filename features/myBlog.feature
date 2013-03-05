Feature: myBlog
    As a visitor, I can view my blog, and use basic function


@blog
Scenario: I can visit my blog without errors
    Given I visit "http://web-quality.over-blog.com"
    Then I don't see errors
    Then I should see "responsable qualité"
    Then I shouldn't see "responsables qualités"


@blog @contact
Scenario: I can visit my blog and see contact form
    Given I visit "http://web-quality.over-blog.com"
    Then I should see link to "contact"
    When I click on "Contact"
    Then I don't see errors
    Then I should see "Conditions d'utilisation"
