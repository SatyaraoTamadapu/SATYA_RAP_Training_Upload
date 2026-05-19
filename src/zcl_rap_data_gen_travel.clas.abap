CLASS zcl_rap_data_gen_travel DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rap_data_gen_travel IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA:
      group_id   TYPE string VALUE '###',
      attachment TYPE /dmo/attachment,
      file_name  TYPE /dmo/filename,
      mime_type  TYPE /dmo/mime_type.


    "clear data
    DELETE FROM ztravel_basic.
    DELETE FROM ztravel_basic_d.

    "fill table with /dmo/travel table data

    INSERT ztravel_basic FROM
    ( SELECT FROM /dmo/travel as travel

      FIELDS
                travel~travel_id        AS travel_id,
                travel~agency_id        AS agency_id,
                travel~customer_id      AS customer_id,
                travel~begin_date       AS begin_date,
                travel~end_date         AS end_date,
                travel~booking_fee      AS booking_fee,
                travel~total_price      AS total_price,
                travel~currency_code    AS currency_code,
                travel~description      AS description,
               travel~createdby        AS created_by,
                travel~createdat        AS created_at,
                travel~lastchangedby    AS last_changed_by,
                travel~lastchangedat    AS last_changed_at,
                travel~lastchangedat    AS local_last_changed_at

    ORDER BY travel_id UP TO 50 ROWS

    ).

COMMIT WORK.

out->write( |[RAP100] Demo data generated for table ZRAP100_ATRAV{ group_id }. | ).


  ENDMETHOD.


ENDCLASS.
