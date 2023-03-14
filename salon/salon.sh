#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~ Salon ~~~~"

#$PSQL "TRUNCATE TABLE customers, appointments"

MAIN_MENU() {

  if [ ! -z "$1" ]
  then
    echo -e "\n$1"
  fi

  echo -e "\n1) Cut\n2) Colour\n3) Extend"
  read SERVICE_ID_SELECTED

  if [[ "$SERVICE_ID_SELECTED" -eq "1" ]] || [[ "$SERVICE_ID_SELECTED" -eq "2" ]] || [[ "$SERVICE_ID_SELECTED" -eq "3" ]]
  then
    echo -e "\nPlease enter your phone number:"
    read CUSTOMER_PHONE

    # customer does not exist
    if [[ -z $($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'") ]]
    then
      echo -e "\nPlease enter your name:"
      read CUSTOMER_NAME
      INSERT_INTO_CUSTOMER=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    else
      # THIS IS HAS ONE TOO MUCH SPACE IN THE BEGINNING
      # THIS IS HAS ONE TOO MUCH SPACE IN THE BEGINNING
      # THIS IS HAS ONE TOO MUCH SPACE IN THE BEGINNING
      # THIS IS HAS ONE TOO MUCH SPACE IN THE BEGINNING
      # THIS IS HAS ONE TOO MUCH SPACE IN THE BEGINNING
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    fi
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    echo -e "\nPlease enter your preferred time:"
    read SERVICE_TIME

    # enter appointment
    APPOINTMENT_INSERTED=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")

    # final message
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

    echo -e "\nI have put you down for a$SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."

  else 
    BACK_TO_MAIN_MENU
  fi
}

BACK_TO_MAIN_MENU () {
  MAIN_MENU
}

MAIN_MENU "Which service would you like to book an appointment for?"