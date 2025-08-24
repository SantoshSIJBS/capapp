using CatalogService as service from '../../srv/cat-service';

annotate CatalogService.PurchaseOrderSet with @(
    UI.SelectionFields          : [
        PO_ID,
        GROSS_AMOUNT,
        PARTNER_GUID.COMPANY_NAME,
        PARTNER_GUID.ADDRESS_GUID.COUNTRY
    ],
    UI.LineItem                 : [
        {
            $Type: 'UI.DataField',
            Value: PO_ID
        },
        {
            $Type: 'UI.DataField',
            Value: PARTNER_GUID.COMPANY_NAME
        },
        {
            $Type: 'UI.DataField',
            Value: GROSS_AMOUNT
        },
        {
            $Type: 'UI.DataField',
            Value: CURRENCY_code
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action: 'CatalogService.discountOnPrice',
            Label : 'Discount',
            Inline: true
        },
        {
            $Type      : 'UI.DataField',
            Value      : LIFECYCLE_STATUS
        },
        {
            $Type      : 'UI.DataField',
            Value      : OVERALL_STATUS
        },
        {
            $Type: 'UI.DataField',
            Value: PARTNER_GUID.ADDRESS_GUID.COUNTRY
        }
    ],
    UI.HeaderInfo               : {
        TypeName      : 'Purchase Order',
        TypeNamePlural: 'Purchase Orders',
        Title         : {
            Label: 'Purchase Order ID',
            Value: PO_ID
        },
        Description   : {
            Label: 'Company',
            Value: PARTNER_GUID.COMPANY_NAME
        },
        ImageUrl      : 'https://media.licdn.com/dms/image/v2/C4E0BAQFSo1I9ANnlJw/company-logo_200_200/company-logo_200_200/0/1630630941774/acte_education_logo?e=2147483647&v=beta&t=tnATcuuAsv6GI7_VxWndNYZDpWSwRgKJLuLCE-UvR8s'
    },
    UI.Facets                   : [
        {
        $Type : 'UI.CollectionFacet',
        Label : 'Purchase Order Details',
        Facets: [
            {
                $Type : 'UI.ReferenceFacet',
                Label : 'More Details',
                Target: '@UI.Identification'
            },
            {
                $Type : 'UI.ReferenceFacet',
                Label : 'Price Details',
                Target: '@UI.FieldGroup#PriceDetails'
            },
            {
                $Type : 'UI.ReferenceFacet',
                Label : 'Status Details',
                Target: '@UI.FieldGroup#StatusDetails'
            }
        ]
    },
    {
        $Type : 'UI.ReferenceFacet',
        Label : 'Purchase Items',
        Target : 'Items/@UI.LineItem'
    }
    ],
    UI.Identification           : [
        {
            $Type: 'UI.DataField',
            Value: PO_ID,
        },
        {
            $Type: 'UI.DataField',
            Label : 'Parnter Node Key',
            Value: PARTNER_GUID_NODE_KEY,
        }
    ],
    UI.FieldGroup #PriceDetails : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: GROSS_AMOUNT
            },
            {
                $Type: 'UI.DataField',
                Value: NET_AMOUNT
            },
            {
                $Type: 'UI.DataField',
                Value: TAX_AMOUNT
            },
            {
                $Type: 'UI.DataField',
                Value: CURRENCY_code
            },
        ]
    },
    UI.FieldGroup #StatusDetails: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'Lifecycle Status',
                Value: LifecycleStatus,
                Criticality : LSCriticality
            },
            {
                $Type: 'UI.DataField',
                Label: 'Overall Status',
                Value: OverallStatus,
                Criticality : OSCriticality
            },
        ]
    }
);

annotate service.POItems with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : PO_ITEMS_POS
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID_NODE_KEY
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT
        },
        {
            $Type : 'UI.DataField',
            Value : NET_AMOUNT
        },
        {
            $Type : 'UI.DataField',
            Value : TAX_AMOUNT
        },
        {
            $Type : 'UI.DataField',
            Value : CURRENCY_code
        },
    ],
    UI.HeaderInfo : {
        $Type : 'UI.HeaderInfoType',
        TypeName : 'Purchase Item',
        TypeNamePlural : 'Purchase Items',
        Title : {
            $Type : 'UI.DataField',
            Value : PO_ITEMS_POS,
        }
    },
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Item Information',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Product Details',
                    Target : '@UI.FieldGroup#ProductData'
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Item Details',
                    Target : '@UI.FieldGroup#ItemData'
                }
            ]
        }
    ],

    UI.FieldGroup #ItemData : {
        Label : 'Item Details',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : PO_ITEMS_POS
            },
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID_NODE_KEY
            },
            {
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT
            },
            {
                $Type : 'UI.DataField',
                Value : NET_AMOUNT
            },
            {
                $Type : 'UI.DataField',
                Value : TAX_AMOUNT
            },
            {
                $Type : 'UI.DataField',
                Value : CURRENCY_code
            },
        ]
    },
    UI.FieldGroup #ProductData : {
        Label : 'Product Details',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Category',
                Value : PRODUCT_GUID.CATEGORY
            },
            {
                $Type : 'UI.DataField',
                Label : 'Description',
                Value : PRODUCT_GUID.DESCRIPTION
            },
            {
                $Type : 'UI.DataField',
                Label : 'Width',
                Value : PRODUCT_GUID.WIDTH
            },
            {
                $Type : 'UI.DataField',
                Label : 'Height',
                Value : PRODUCT_GUID.HEIGHT
            },
            {
                $Type : 'UI.DataField',
                Label : 'Depth',
                Value : PRODUCT_GUID.DEPTH
            },
            {
                $Type : 'UI.DataField',
                Label : 'Price',
                Value : PRODUCT_GUID.PRICE
            },
            {
                $Type : 'UI.DataField',
                Label : 'Category',
                Value : PRODUCT_GUID.SUPPLIER_GUID.ADDRESS_GUID.COUNTRY
            },
            {
                $Type : 'UI.DataField',
                Label : 'Company Name',
                Value : PRODUCT_GUID.SUPPLIER_GUID.COMPANY_NAME
            }
        ]
    }
) ;

annotate service.PurchaseOrderSet with {
    PARTNER_GUID@(
        Common : {
            Text : PARTNER_GUID.COMPANY_NAME,
        },
        ValueList.entity: service.BusinessPartnerSet
    )
};

annotate service.POItems with {
    PRODUCT_GUID@(
        Common : {
            Text : PRODUCT_GUID.DESCRIPTION,
        },
        ValueList.entity : service.ProductSet
    )
};


@cds.odata.valuelist
annotate service.BusinessPartnerSet with @(
    UI.Identification:[
        {
            $Type : 'UI.DataField',
            Value : COMPANY_NAME
        }
    ]
);

@cds.odata.valuelist
annotate service.ProductSet with @(
    UI.Identification: [
        {
            $Type : 'UI.DataField',
            Value : DESCRIPTION
        }
    ]
);