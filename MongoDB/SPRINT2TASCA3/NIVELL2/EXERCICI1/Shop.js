db.createCollection('Shop', {validator: {$jsonSchema: {bsonType: 'object',title: 'Shop',required: ['adress','order','employee'],properties:{adress:{bsonType: 'object',title: 'object',properties:{postal_code:{bsonType: 'string'},locality:{bsonType: 'string'},province:{bsonType: 'string'}}},order:{bsonType: 'object',title: 'object',required: ['id_order','products','type','client','time'],properties:{id_order:{bsonType: 'objectId'},products:{bsonType: 'array',items:{title: 'object',required: ['product','quantity'],properties:{product:{bsonType: 'object',title: 'object',required: ['id_product','type','name','price'],properties:{id_product:{bsonType: 'objectId'},type:{enum: },pizza:{bsonType: 'object',title: 'object',properties:{type:{enum: }}},name:{bsonType: 'string'},description:{bsonType: 'string'},image:{bsonType: 'binData'},price:{bsonType: 'double'}}},quantity:{bsonType: 'int'}}}},type:{enum: },delivery:{bsonType: 'object',title: 'object',required: ['delivery_person','adress'],properties:{delivery_person:{bsonType: 'object',title: 'object',required: ['id_employee','name','surname','nif','phone','position'],properties:{id_employee:{bsonType: 'objectId'},name:{bsonType: 'string'},surname:{bsonType: 'string'},nif:{bsonType: 'string'},phone:{bsonType: 'string'},position:{enum: }}},adress:{bsonType: 'object',title: 'object',required: ['postal_code','locality','province','street','number'],properties:{postal_code:{bsonType: 'string'},locality:{bsonType: 'string'},province:{bsonType: 'string'},street:{bsonType: 'string'},number:{bsonType: 'string'},floor:{bsonType: 'string'},door:{bsonType: 'string'}}},time_delivered:{bsonType: 'date'}}},client:{bsonType: 'object',title: 'object',properties:{name:{bsonType: 'string'},surname:{bsonType: 'string'},phone:{bsonType: 'string'}}},additional_info:{bsonType: 'string'},time:{bsonType: 'date'}}},employee:{bsonType: 'object',title: 'object',required: ['id_employee','position','name','surname','nif','phone'],properties:{id_employee:{bsonType: 'objectId'},position:{enum: },name:{bsonType: 'string'},surname:{bsonType: 'string'},nif:{bsonType: 'string'},phone:{bsonType: 'string'}}}}}}});