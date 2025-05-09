generator client {
provider = "prisma-client-js"
}

datasource db {
provider = "mysql"
url = env("DATABASE_URL")
}

model City {
id String @id @default(cuid())
name String  
 createdAt DateTime @default(now())
updatedAt DateTime @updatedAt
neighborhoods Neighborhood[]
}

model Neighborhood {
id String @id @default(cuid())
name String  
 cityId String  
 createdAt DateTime @default(now())
updatedAt DateTime @updatedAt
city City @relation(fields: [cityId], references: [id])
}

model Property {
id String @id @default(cuid())
title String  
 negotiationType String  
 description String  
 bedrooms Int  
 bathrooms Int  
 suites Int  
 price Float  
 latitude Float?  
 longitude Float?  
 neighborhood String  
 cityId String  
 state String  
 address String?

propertyTypeId String?  
 propertyType PropertyType? @relation(fields: [propertyTypeId], references: [id])

ownerId String?
owner Owner? @relation(fields: [ownerId], references: [id]) // Novo relacionamento

createdAt DateTime @default(now())
updatedAt DateTime @updatedAt
rentalContracts RentalContract[]
}

model Client {
id String @id @default(cuid())
name String
email String
cpf String
phone String
createdAt DateTime @default(now())
updatedAt DateTime @updatedAt
rentalContracts RentalContract[]  
}

model RentalContract {
id String @id @default(cuid())
clientId String  
 propertyId String  
 startDate DateTime
endDate DateTime?
monthlyRent Float  
 depositAmount Float?  
 status String  
 createdAt DateTime @default(now())
updatedAt DateTime @updatedAt
client Client @relation(fields: [clientId], references: [id])  
 property Property @relation(fields: [propertyId], references: [id])  
 payments RentPayment[]
}

model RentPayment {
id String @id @default(cuid())
rentalContractId String
rentalContract RentalContract @relation(fields: [rentalContractId], references: [id])
dueDate DateTime //data de vencimento
paymentDate DateTime?
amount Float
status PaymentStatus
createdAt DateTime @default(now())
updatedAt DateTime @updatedAt
}

enum PaymentStatus {
pendente
pago
atrasado

}

model User{
id String @id @default(cuid())
name String
email String
password String
createdAt DateTime @default(now())
updatedAt DateTime @updatedAt
}

model PropertyType{
id String @id @default(cuid())
name String
createdAt DateTime @default(now())
updatedAt DateTime @updatedAt
properties Property[]
}

model Owner {
id String @id @default(cuid())
name String
email String
cpf String
phone String
createdAt DateTime @default(now())
updatedAt DateTime @updatedAt
properties Property[] // Um dono pode ter vários imóveis
}
