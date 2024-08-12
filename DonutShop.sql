create table OnlineStore.ACCOUNTS
(
    ACCOUNT_ID   int auto_increment
        primary key,
    EMAIL        varchar(50)  not null,
    PASSWORD     char(50)     not null,
    F_NAME       varchar(50)  null,
    L_NAME       varchar(50)  null,
    ADDRESS      varchar(100) null,
    PHONE_NUMBER varchar(15)  null,
    ZIP_CODE     varchar(11)  null,
    CC_NUMBER    varchar(20)  null,
    DOB          date         null,
    constraint IDENTIFIER
        unique (EMAIL)
)
    engine = InnoDB;

create table OnlineStore.CUSTOMER
(
    CUSTOMER_ID  int auto_increment
        primary key,
    F_NAME       varchar(50)  null,
    L_NAME       varchar(50)  null,
    ADDRESS      varchar(100) null,
    PHONE_NUMBER varchar(15)  null,
    ZIP_CODE     varchar(11)  null,
    CC_NUMBER    varchar(20)  null,
    DOB          date         null
)
    engine = InnoDB;

create table OnlineStore.DONUT_TYPE
(
    DONUT_TYPE_ID     int auto_increment
        primary key,
    DONUT_NAME        varchar(50)    null,
    DONUT_FLAVOR      varchar(50)    null,
    DONUT_IMAGE_PATH  varchar(255)   null,
    DONUT_INGREDIENTS varchar(255)   null,
    DONUT_PRICE       decimal(10, 2) null
)
    engine = InnoDB;

create table OnlineStore.DONUTS
(
    DONUT_ID      int auto_increment
        primary key,
    DONUT_TYPE_ID int not null,
    constraint FK_DONUT_TYPE
        foreign key (DONUT_TYPE_ID) references OnlineStore.DONUT_TYPE (DONUT_TYPE_ID)
)
    engine = InnoDB;

create table OnlineStore.ORDERS
(
    ORDER_ID    int auto_increment
        primary key,
    ORDER_DATE  datetime null,
    CUSTOMER_ID int      null,
    ACCOUNT_ID  int      null,
    constraint FK_ACCOUNT
        foreign key (ACCOUNT_ID) references OnlineStore.ACCOUNTS (ACCOUNT_ID),
    constraint FK_CUSTOMER
        foreign key (CUSTOMER_ID) references OnlineStore.CUSTOMER (CUSTOMER_ID)
)
    engine = InnoDB;

create table OnlineStore.ORDER_ITEMS
(
    ORDER_ITEM_ID int auto_increment
        primary key,
    ORDER_ID      int            not null,
    DONUT_ID      int            not null,
    UNIT_PRICE    decimal(10, 2) null,
    constraint FK_DONUT
        foreign key (DONUT_ID) references OnlineStore.DONUTS (DONUT_ID),
    constraint FK_ORDER
        foreign key (ORDER_ID) references OnlineStore.ORDERS (ORDER_ID)
)
    engine = InnoDB;

