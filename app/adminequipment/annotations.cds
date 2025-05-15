using AdminService as service from '../../srv/AdminService';
annotate service.Equipments with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Value : type.name,
            Label : '{i18n>EquipmentType}',
        },
        {
            $Type : 'UI.DataField',
            Value : manufacturing,
            Label : '{i18n>Manufacturing}',
        },
        {
            $Type : 'UI.DataField',
            Value : description,
        },
        {
            $Type : 'UI.DataField',
            Value : status_equipmentCode,
            Label : '{i18n>Status}',
            Criticality : status.colorCode,
            CriticalityRepresentation : #WithIcon,
        },
    ],
    UI.SelectionFields : [
        type_code,
        status_equipmentCode,
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Equipment Details',
            ID : 'EquipmentDetails',
            Target : '@UI.FieldGroup#EquipmentDetails',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>EquipmentTaskDetails}',
            ID : 'i18nEquipmentTaskDetails',
            Target : 'tasks/@UI.LineItem#i18nEquipmentTaskDetails',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>IssueDetails}',
            ID : 'i18nIssueDetails',
            Target : 'issues/@UI.LineItem#i18nIssueDetails',
        },
    ],
    UI.FieldGroup #EquipmentDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ID,
                Label : 'ID',
            },
            {
                $Type : 'UI.DataField',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : type_code,
            },
        ],
    },
    UI.DataPoint #ID : {
        $Type : 'UI.DataPointType',
        Value : ID,
        Title : 'ID',
    },
    UI.DataPoint #location_locationId : {
        $Type : 'UI.DataPointType',
        Value : location_locationId,
        Title : '{i18n>Location}',
    },
    UI.DataPoint #status_equipmentCode : {
        $Type : 'UI.DataPointType',
        Value : status_equipmentCode,
        Title : '{i18n>Status}',
        Criticality : status.colorCode,
    },
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'location_locationId',
            Target : '@UI.DataPoint#location_locationId',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'status_equipmentCode',
            Target : '@UI.DataPoint#status_equipmentCode',
        },
    ],
    UI.HeaderInfo : {
        TypeName : 'name',
        TypeNamePlural : 'Equipments',
        Title : {
            $Type : 'UI.DataField',
            Value : name,
        },
    },
);

annotate service.Equipments with {
    type @(
        Common.Label : '{i18n>EquipmentType}',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'EquipmentTypes',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : type_code,
                    ValueListProperty : 'code',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.EquipmentTypes with {
    code @Common.Text : name
};

annotate service.EquipmentTypes with {
    name @Common.Text : code
};

annotate service.Equipments with {
    status @(
        Common.Label : '{i18n>Status}',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'EquipmentStatus',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : status_equipmentCode,
                    ValueListProperty : 'equipmentCode',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.EquipmentStatus with {
    equipmentCode @Common.Text : name
};

annotate service.Tasks with @(
    UI.LineItem #i18nEquipmentTaskDetails : [
        {
            $Type : 'UI.DataField',
            Value : equipment_ID,
            Label : 'Equipment ID',
        },
        {
            $Type : 'UI.DataField',
            Value : description,
            Label : 'Description',
        },
        {
            $Type : 'UI.DataField',
            Value : dueDate,
            Label : 'Due Date',
        },
        {
            $Type : 'UI.DataField',
            Value : priority_code,
            Label : 'Priority',
        },
        {
            $Type : 'UI.DataField',
            Value : status_code,
            Label : 'Status',
        },
    ]
);

annotate service.Issues with @(
    UI.LineItem #i18nIssueDetails : [
        {
            $Type : 'UI.DataField',
            Value : description,
            Label : 'Description',
        },
        {
            $Type : 'UI.DataField',
            Value : createdBy,
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt,
        },
        {
            $Type : 'UI.DataField',
            Value : equipment_ID,
            Label : 'Equipment ID',
        },
        {
            $Type : 'UI.DataField',
            Value : issueStatus_statusCode,
            Label : '{i18n>IssueStatus}',
        },
        {
            $Type : 'UI.DataField',
            Value : reportedBy_ID,
            Label : '{i18n>ReportedBy}',
        },
    ]
);

