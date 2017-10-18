Feature: Taxi booking
As a customer
Such that I go to destination
I want to arrange a taxi ride

    Scenario: Booking via STRS' web page (with confirmation)
        Given the following taxis are on duty
            | username | location  | status    |
            | juhan85  | Kaubamaja | busy      |
            | peeter88 | Kaubamaja | available |
        And I want to go from "Liivi 2" to "Lõunakeskus"
        And I open STRS' web page
        And I enter the booking information
        When I summit the booking request
        Then I should receive a confirmation message

    Scenario: Booking via STRS' web page (with rejection)
        Given the following taxis are on duty
            | username | location  | status    |
            | juhan85  | Kaubamaja | busy      |
            | peeter88 | Kaubamaja | busy      |
        And I want to go from "Liivi 2" to "Lõunakeskus"
        And I open STRS' web page
        And I enter the booking information
        When I summit the booking request
        Then I should receive a rejection message