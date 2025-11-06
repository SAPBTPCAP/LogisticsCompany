using LogisticsCompanyService as service from '../../srv/Fields';
annotate service.VehiclesSet with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : regNumber,
            },
            {
                $Type : 'UI.DataField',
                Value : model,
            },
            {
                $Type : 'UI.DataField',
                Value : inServiceSince,
            },
            {
                $Type : 'UI.DataField',
                Value : odometer,
            },
            {
                $Type : 'UI.DataField',
                Value : totalHoursSpent,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : regNumber,
        },
        {
            $Type : 'UI.DataField',
            Value : model,
        },
        {
            $Type : 'UI.DataField',
            Value : inServiceSince,
        },
        {
            $Type : 'UI.DataField',
            Value : odometer,
        },
        {
            $Type : 'UI.DataField',
            Value : totalHoursSpent,
        },
    ],
);

