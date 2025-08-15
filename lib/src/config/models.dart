abstract class Models {
  // Продажи

  // Коммерческие предложения
  static const offers = 'offers';
  static const offersStatus = 'offerstatus';
  static const offerGoods = 'offergoods';
  static const offerStatusGroup = 'offerstatusgroup';
  static const offerStatusTransition = 'offerstatustransition';

  // Заказы покупателей
  static const customerOrders = 'customerorders';
  static const customerOrderStatus = 'customerorderstatus';
  static const customerOrderGoods = 'customerordergoods';
  static const customerOrderStatusGroup = 'customerorderstatusgroup.json';
  static const customerOrderStatusTransition = 'customerorderstatustransition';
  static const customerOrdersSearch = 'customerorderssearch';

  // Счета покупателей
  static const customerInvoices = 'customerinvoices';
  static const customerInvoiceStatus = 'customerinvoicestatus';
  static const customerInvoiceGoods = 'customerinvoicegoods';
  static const customerInvoiceStatusGroup = 'customerinvoicestatusgroup';
  static const customerInvoiceStatusTransition = 'customerinvoicestatustransition';

  // Реализации
  static const realizations = 'realizations';
  static const realizationStatus = 'realizationstatus';
  static const realizationGoods = 'realizationgoods';
  static const realizationStatusGroup = 'realizationstatusgroup';
  static const realizationStatusTransition = 'realizationstatustransition';
  
  // Резервирование
  static const reservations = 'reservations';
  static const reservationGoods = 'reservationgoods';
  
  // Возвраты от покупателей
  static const returnBuyers = 'returnbuyers';
  static const returnBuyerGoods = 'returnbuyergoods';
  static const returnBuyerStatus = 'returnbuyerstatus';
  static const returnBuyerStatusGroup = 'returnbuyerstatusgroup';
  static const returnBuyerStatusTransition = 'returnbuyerstatustransition';

  // Счета-фактуры исходящие
  static const invoiceOut = 'invoiceout';
  static const invoiceOutDetails = 'invoiceoutdetails';
  
  // Акты выполненный работ
  static const acceptance = 'acceptance';
  static const acceptanceGoods = 'acceptancegoods';
  static const acceptanceStatusGroup = 'acceptancestatussroup';
  static const acceptanceStatus = 'acceptancestatus';

  // Закупки

  // Заказы поставщикам
  static const supplierOrders = 'supplierorders';
  static const supplierOrderStatus = 'supplierorderstatus';
  static const supplierOrderGoods = 'supplierordergoods';
  static const supplierORderStatusGroup = 'supplierorderstatusgroup';
  static const supplierOrderStatusTransition = 'supplierstatustransition';

  // Счета поставщиков
  static const supplierinvoices = 'supplierinvoices';
  static const supplierInvoiceStatus = 'supplierinvoicestatus';
  static const supplierInvoiceGoods = 'supplierinvoicegoods';
  static const supplierInvoiceStatusGroup = 'supplierinvoicestatusgroup';
  static const supplierInvoiceStatusTransition = 'supplierinvoicestatustransition';

  // Поступления
  static const supplies = 'supplies';
  static const supplyStatus = 'supplystatus';
  static const supplyGoods = 'supplygoods';
  static const supplyStatusGroup = 'supplystatusgroup';
  static const supplyStatusTransition = 'supplystatustransition';

  // Возвраты поставщикам
  static const returnSuppliers = 'returnsuppliers';
  static const returnSupplierStatus = 'returnsupplierstatus';
  static const returnSupplierGoods = 'returnsuppliergoods';
  static const returnSupplierStatusGroup = 'returnsupplierstatusgroup';
  static const returnSupplierStatusTransition = 'returnsupplierstatustransition';

  // Счета-фактуры входящие
  static const invoiceIn = 'invoicein';
  static const invoiceInDetails = 'invoiceindetails';

  // Склады
  
  static const stores = 'stores';
  static const storeGoods = 'storegoods';

  // Ввод остатков по складам
  static const remains = 'remains';
  static const remainGoods = 'remaingoods';
  
  // Инвентаризация
  static const inventories = 'inventories';
  static const inventoryGoods = 'inventorygoods';

  // Списание товаров
  static const charges = 'charges';
  static const chargeGoods = 'chargegoods';

  // Оприходования товаров
  static const postings = 'postings';
  static const postingGodos = 'postingGoods';

  // Перемещения
  static const shiftings = 'shiftings';
  static const shiftingGoods = 'shiftinggoods';

  // Внутренние заказы
  static const internalOrders = 'internalorders';
  static const internalOrderStatus = 'internalorderstatus';
  static const internalOrderGoods = 'internalordergoods';
  static const internalOrderStatusGroup = 'internalorderstatusgroup';
  static const internalOrderStatusTransition = 'internalorderstatustransition';

  // Финансы

  // Приходные кассовые ордера
  static const cashIn = 'cashin';
  static const cashInOperations = 'cashinoperations';
  static const cashIntoCustomerOrder = 'cashincustomerorder';
  static const cashInCostItem = 'cashincostitem';
  
  // Расходные кассовые ордера
  static const cashOut = 'cashout';
  static const cashOutOperations = 'cashoutoperations';
  static const cashOutContributionTypes = 'cashoutcontributiontypes';
  static const cashOutCostItem = 'cashoutcostitem';

  // Платежные поручения входящие
  static const paymentIn = 'paymentin';
  static const paymentInOperations = 'paymentsinoperations';
  static const paymentInStatus = 'paymentinstatus';
  static const paymentInStatusGroup = 'paymentinstatusgroup';
  static const paymentInStatusTransition = 'paymentinstatustransition';
  static const paymentIntoCustomerOrder = 'paymentintoustomerorder';
  static const paymentInCostItem = 'paymentincostitem';
  static const paymentIntoDocument = 'paymentintodocument';

  // Платежные поручения исходящие
  static const paymentOut = 'paymentout';
  static const paymentOutOperations = 'paymentoutoperations';
  static const paymentOutContributionTypes = 'paymentoutcontributiontypes';
  static const paymentOutStatus = 'paymentoutstatus';
  static const paymentOutStatusTransition = 'paymentoutstatustransition';
  static const paymentOutCostItem = 'paymentoutcostitem';
  static const paymentOutToDocument = 'paymentouttodocument';

  // CRM

  static const callog = 'callog';

  // Сделки
  static const deals = 'deals';
  static const dealStatus = 'dealstatus';
  static const dealGoods = 'dealgoods';
  static const dealBudget = 'dealbudget';
  static const dealContactinfo = 'dealcontactinfo';
  static const dealStatusGroup = 'dealstatusgroup';
  static const dealStatusTransition = 'dealstatustransition';
  static const dealComments = 'dealcomments';

  // Задачи
  static const tasks = 'tasks';
  static const taskStatus = 'taskstatus';
  static const taskTypes = 'tasktypes';
  static const taskStatusGroup = 'taskstatusgroup';
  static const taskStatusTransition = 'taskstatustransition';

  // Обращения
  static const requests = 'requests';
  static const requestStatus = 'requeststatus';
  static const requestStatusGroup = 'requeststatusgroup';
  static const requestActions = 'requestactions';
  static const requestStatusTransition = 'requeststatustransition';

  // Сообщения и расылки
  static const sms = 'sms';
  static const senders = 'senders';
  static const senderLists = 'senderlists';
  static const senderListContacts =  'senderlistcontacts';

  // Товары и услуги

  static const goods = 'goods';
  static const groupsOfGoods = 'groupsofgoods';
  static const goodsMeasures = 'goodsmeasures';
  static const barcodes = 'barcodes';
  static const goodsAnalogs = 'goodsanalogs';
  static const kitComponents = 'kitcomponents';
  static const goodsSearch = 'goodssearch';
  static const goodsRelated = 'goodsrelated';
  static const goodsImages = 'goodsimages';
  static const goodsModificationsImages = 'goodsmodificationsimages';
  
  // Атрибуты (характеристики товаров)

  static const attributesForGoods = 'attributesforgoods';
  static const attributesForGoodsValues = 'attributesforgoodsvalues';
  static const goodsAttributes = 'goodsattributes';

  // Модификации товаров

  static const attributesForModifications = 'attributesformodifications';
  static const attributesForModificationsValues = 'attributesformodificationsvalues';
  static const modificationsAttributes = 'modificationsattributes';
  static const goodsModifications = 'goodsmodifications';

  // Контрагенты

  static const partners = 'partners';
  static const partnerStatus = 'partnerstatus';
  static const partnerCurrentAccounts = 'partnercurrentaccounts';
  static const partnerContactInfo = 'partnercontactinfo';
  static const partnerStatusGroup = 'partnerstatusgroup';
  static const partnerDebt = 'partnerdebt';
  static const partnersSearch = 'partnerssearch';
  static const partnerStatusTransition = 'partnerstatustransition';
  static const analytics = 'analytics';

  // Контактные лица контрагентов

  static const partnerEmployees = 'partneremployees';
  static const partnerEmployeeContactInfo = 'partneremployeecontactinfo';

  // Характеристики контрагентов

  static const organizationCategories = 'organizationcategories';
  static const organizationKinds = 'organizationkinds';
  static const organizationRegions = 'organizationregions';
  static const organizationSizes = 'organizationsizes';

  // Розница

  static const retailCashiers = 'retailcashiers';

  // Кассовые чеки

  static const retailChecks = 'retailchecks';
  static const retailCheckGoods = 'retailcheckgoods';
  static const retailChecksSearch = 'retailcheckssearch';

  // Возвраты от розничных покупателей

  static const retailReturns = 'retailreturns';
  static const retailReturnGoods = 'retailreturngoods';
  static const retailReturnSearch = 'retailreturnsearch';

  // Розничные точки

  static const retailPoints = 'retailpoints';
  static const retailShifts = 'retailshifts';
  
  // Инкассации

  static const retailCashIn = 'retailcashin';
  static const retailCashOut = 'retailcashout';

  // Прайс-листы

  static const currentPrices = 'currentprices';

  // Отпускные цены
  
  static const salePriceTypes = 'salepricetypes';
  static const salePriceLists = 'salepricelists';
  static const salePriceListsPriceTypes = 'salepricelistspricetypes';
  static const salePriceListGoods = 'salepricelistgoods';
  static const salePriceListGoodPrices = 'salepricelistgoodprices';

  // Закупочные цены

  static const buyPriceTypes = 'buypricetypes';
  static const buyPriceLists = 'buypricelists';
  static const buyPriceListsPriceTypes = 'buypricelistspricetypes';
  static const buyPriceListGoods = 'buypricelistgoods';
  static const buyPriceListGoodPrices = 'buypricelistgoodprices';

  // Данные аккаунта

  static const organizations = 'organizations';
  static const employees = 'employees';
  static const currentAccounts = 'currentaccounts';
  static const employeeContactInfo = 'employeecontactinfo';
  static const employeesSearch = 'employeessearch';
  static const roles = 'roles';
  static const organizationContactInfo = 'organizationcontactinfo';

  // Системы лояльности

  // Дисконтные и бонусные карты
  static const discountCards = 'discountcards';
  static const discountCardTypes = 'discountcardtypes';
  static const discountCardBonuses = 'discountcardbonuses';
  static const discountCardBonusesChargingConditions = 'discountcardbonuseschargingconditions';
  static const discountCardBonusesWriteOffConditions = 'discountcardbonuseswriteoffconditions';

  // Автоматические скидки
  static const discounts = 'discounts';
  static const discountGoods = 'discountgoods';

  // Дополнительные справочники
  static const measures = 'measures';
  static const currencies = 'currencies';
  static const contactInfoTypes = 'contactinfotypes';
  static const organizationTypes = 'organizationtypes';
  static const legacyTypes = 'legacytypes';
  static const contracts = 'contracts';
  static const countries = 'countries';
  static const couriers = 'couriers';
  static const cash = 'cash';
  static const kkm = 'kkm';
  static const deliveryTypes = 'deliverytypes';
  static const employeePosts = 'employeeposts';
  static const nds = 'nds';
  static const departments = 'departments';
  static const paymentTypes = 'paymenttypes';
  static const currencyHistory = 'currencyhistory';
  static const banks = 'banks';
  static const globalBanks = 'globalbanks';
  static const purchaseFunnels = 'purchasefunnels';
  static const requestSource = 'requestsource';
  static const costItems = 'costitems';

  // Отчеты
  static const models = 'models';
  static const reports = 'reports';
  static const customerOrderCostReports = 'customerordercostreports';

  // Вебхуки
  static const webhookModels = 'webhookmodels';
  static const webhooks = 'webhooks';
  static const webhookUrl = 'webhookurl';

  // Уведомления
  static const notifications = 'notifications';
  static const docrelations = 'docrelations';

  // Комментарии
  static const comments = 'comments';

  // Логистика

  // Заказы на доставку
  static const deliveryOrders = 'deliveryorders';
  static const deliveryOrderGoods = 'deliveryordergoods';
  static const deliveryOrderStatusGroup = 'deliveryorderstatusgroup';
  static const deliveryOrderStatus = 'deliveryorderstatus';
  static const deliveryOrderStatusTransition = 'deliveryorderstatustransition';

  // Маршрутные листы
  static const routeSheets = 'routesheets';
  static const routeSheetsDeliveryOrders = 'routesheetsdeliveryorders';
  static const routeSheetStatusGroup = 'routesheetstatusgroup';
  static const routeSheetStatus = 'routesheetstatus';
  static const routeSheetStatusTransition = 'routesheetstatustransition';
}
