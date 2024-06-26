PGDMP  )    8                |            test    16.2    16.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16414    test    DATABASE        CREATE DATABASE test WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE test;
                postgres    false            �            1259    16415    Customer    TABLE     $  CREATE TABLE public."Customer" (
    "ID" character(6) NOT NULL,
    "LastName" character varying(30),
    "FirstName" character varying(30),
    address character varying(30),
    "City" character(2),
    state character(5),
    zip character varying(10),
    phone character varying(30)
);
    DROP TABLE public."Customer";
       public         heap    postgres    false            �           0    0    TABLE "Customer"    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public."Customer" TO salesman;
GRANT SELECT ON TABLE public."Customer" TO acountant;
          public          postgres    false    215            �            1259    16435    Order    TABLE     �   CREATE TABLE public."Order" (
    "ID" character(6) NOT NULL,
    "Customer_id" character(6) NOT NULL,
    "Product_id" character(6) NOT NULL,
    "PurchaseDate" date,
    "Quantity" int4multirange,
    "Total" money
);
    DROP TABLE public."Order";
       public         heap    postgres    false            �           0    0    TABLE "Order"    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public."Order" TO salesman;
GRANT SELECT,INSERT,UPDATE ON TABLE public."Order" TO acountant;
          public          postgres    false    217            �            1259    16430    Product    TABLE     �   CREATE TABLE public."Product" (
    "Product_id" character(6) NOT NULL,
    "Name" character varying(30),
    "Model" character varying(30),
    "Manufacturer" character varying(30),
    "Unitprice" money,
    inventory int4multirange
);
    DROP TABLE public."Product";
       public         heap    postgres    false            �           0    0    TABLE "Product"    ACL     w   GRANT SELECT ON TABLE public."Product" TO salesman;
GRANT SELECT,INSERT,UPDATE ON TABLE public."Product" TO acountant;
          public          postgres    false    216            �          0    16415    Customer 
   TABLE DATA           g   COPY public."Customer" ("ID", "LastName", "FirstName", address, "City", state, zip, phone) FROM stdin;
    public          postgres    false    215   J       �          0    16435    Order 
   TABLE DATA           i   COPY public."Order" ("ID", "Customer_id", "Product_id", "PurchaseDate", "Quantity", "Total") FROM stdin;
    public          postgres    false    217   y       �          0    16430    Product 
   TABLE DATA           j   COPY public."Product" ("Product_id", "Name", "Model", "Manufacturer", "Unitprice", inventory) FROM stdin;
    public          postgres    false    216   �       "           2606    16678    Customer Customer_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Customer"
    ADD CONSTRAINT "Customer_pkey" PRIMARY KEY ("ID");
 D   ALTER TABLE ONLY public."Customer" DROP CONSTRAINT "Customer_pkey";
       public            postgres    false    215            &           2606    16439    Order Order_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY ("ID");
 >   ALTER TABLE ONLY public."Order" DROP CONSTRAINT "Order_pkey";
       public            postgres    false    217            $           2606    16434    Product Product_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY ("Product_id");
 B   ALTER TABLE ONLY public."Product" DROP CONSTRAINT "Product_pkey";
       public            postgres    false    216            '           2606    16687    Order k1    FK CONSTRAINT     �   ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT k1 FOREIGN KEY ("Customer_id") REFERENCES public."Customer"("ID") NOT VALID;
 4   ALTER TABLE ONLY public."Order" DROP CONSTRAINT k1;
       public          postgres    false    217    215    4642            (           2606    16692    Order k2    FK CONSTRAINT     �   ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT k2 FOREIGN KEY ("Product_id") REFERENCES public."Product"("Product_id") NOT VALID;
 4   ALTER TABLE ONLY public."Order" DROP CONSTRAINT k2;
       public          postgres    false    4644    217    216            �      x�342611���D\�@9S3�r1z\\\ �%�      �       x�34 NC#cS3N0ǈ3���b���� s�V      �   .   x�30 CN�ļC�?8�IAd�0e�9�S�Ѵ��qqq ��     