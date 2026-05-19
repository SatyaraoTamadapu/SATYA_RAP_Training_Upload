@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZTRAVEL_BASIC'
@EndUserText.label: '###GENERATED Core Data Service Entity 000'
define root view entity ZR_TRAVEL_BASIC
  as select from ztravel_basic

  association [0..1] to /DMO/I_Agency   as _Agency   on $projection.AgencyID = _Agency.AgencyID
  association [0..1] to /DMO/I_Customer as _Customer on $projection.CustomerID = _Customer.CustomerID
  // association [1..1] to /DMO/I_Overall_Status_VH as _OverallStatus on $projection.OverallStatus = _OverallStatus.OverallStatus
  association [0..1] to I_Currency      as _Currency on $projection.CurrenyCode = _Currency.Currency
{

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.90
  key travel_id             as TravelID,

      @Search.defaultSearchElement: true
  //    @ObjectModel.text.element: ['AgencyName']
  //    @Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Agency', element: 'AgencyID' }, useForValidation: true }]
      agency_id             as AgencyID,
      _Agency.Name          as AgencyName,

      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['CustomerName']
      @Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Customer', element: 'CustomerID'  }, useForValidation: true }]
      customer_id           as CustomerID,
      _Customer.LastName    as CustomerName,
      begin_date            as BeginDate,
      end_date              as EndDate,
      @Semantics.amount.currencyCode: 'CurrenyCode'
      booking_fee           as BookingFee,
      @Semantics.amount.currencyCode: 'CurrenyCode'
      total_price           as TotalPrice,
      @Consumption.valueHelpDefinition: [ {
        entity.name: 'I_CurrencyStdVH',
        entity.element: 'Currency',
        useForValidation: true
      } ]


      curreny_code          as CurrenyCode,
      description           as Description,
      @Semantics.user.createdBy: true
      created_by            as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at            as CreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      //public associations
      _Customer,
      _Agency,
      //_OverallStatus,
      _Currency
}
