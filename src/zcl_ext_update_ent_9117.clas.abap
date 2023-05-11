CLASS zcl_ext_update_ent_9117 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_ext_update_ent_9117 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    MODIFY ENTITIES OF z_i_travel_9117
             ENTITY Travel
             UPDATE FIELDS ( agency_id description )
             WITH VALUE #( ( travel_id = '00000001'
                             agency_id = '070041'
                             description = 'Vacation' ) )
             FAILED data(failed)
             REPORTED data(reported).

    READ ENTITIES OF z_i_travel_9117
           ENTITY Travel
           FIELDS ( agency_id description )
           WITH VALUE #( ( travel_id = '00000001'  ) )
           RESULT DATA(lt_travel_data)
           FAILED failed
           REPORTED reported.

   COMMIT ENTITIES.

   if failed IS INITIAL.
     out->write( 'Commit Successfull' ).
   ELSE.
     out->write( 'Commit Failed' ).
   endif.
  ENDMETHOD.

ENDCLASS.
