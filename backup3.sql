toc.dat                                                                                             0000600 0004000 0002000 00000012032 14574777166 0014465 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       5                |            test    16.2    16.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         �           1262    16414    test    DATABASE        CREATE DATABASE test WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE test;
                postgres    false         �            1259    16415    Customer    TABLE     $  CREATE TABLE public."Customer" (
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
       public         heap    postgres    false         �           0    0    TABLE "Customer"    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public."Customer" TO salesman;
GRANT SELECT ON TABLE public."Customer" TO acountant;
          public          postgres    false    215         �            1259    16435    Order    TABLE     �   CREATE TABLE public."Order" (
    "ID" character(6) NOT NULL,
    "Customer_id" character(6) NOT NULL,
    "Product_id" character(6) NOT NULL,
    "PurchaseDate" date,
    "Quantity" int4multirange,
    "Total" money
);
    DROP TABLE public."Order";
       public         heap    postgres    false         �           0    0    TABLE "Order"    ACL     �   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public."Order" TO salesman;
GRANT SELECT,INSERT,UPDATE ON TABLE public."Order" TO acountant;
          public          postgres    false    217         �            1259    16430    Product    TABLE     �   CREATE TABLE public."Product" (
    "Product_id" character(6) NOT NULL,
    "Name" character varying(30),
    "Model" character varying(30),
    "Manufacturer" character varying(30),
    "Unitprice" money,
    inventory int4multirange
);
    DROP TABLE public."Product";
       public         heap    postgres    false         �           0    0    TABLE "Product"    ACL     w   GRANT SELECT ON TABLE public."Product" TO salesman;
GRANT SELECT,INSERT,UPDATE ON TABLE public."Product" TO acountant;
          public          postgres    false    216         �          0    16415    Customer 
   TABLE DATA           g   COPY public."Customer" ("ID", "LastName", "FirstName", address, "City", state, zip, phone) FROM stdin;
    public          postgres    false    215       4792.dat �          0    16435    Order 
   TABLE DATA           i   COPY public."Order" ("ID", "Customer_id", "Product_id", "PurchaseDate", "Quantity", "Total") FROM stdin;
    public          postgres    false    217       4794.dat �          0    16430    Product 
   TABLE DATA           j   COPY public."Product" ("Product_id", "Name", "Model", "Manufacturer", "Unitprice", inventory) FROM stdin;
    public          postgres    false    216       4793.dat "           2606    16678    Customer Customer_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Customer"
    ADD CONSTRAINT "Customer_pkey" PRIMARY KEY ("ID");
 D   ALTER TABLE ONLY public."Customer" DROP CONSTRAINT "Customer_pkey";
       public            postgres    false    215         &           2606    16439    Order Order_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY ("ID");
 >   ALTER TABLE ONLY public."Order" DROP CONSTRAINT "Order_pkey";
       public            postgres    false    217         $           2606    16434    Product Product_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY ("Product_id");
 B   ALTER TABLE ONLY public."Product" DROP CONSTRAINT "Product_pkey";
       public            postgres    false    216         '           2606    16687    Order k1    FK CONSTRAINT     �   ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT k1 FOREIGN KEY ("Customer_id") REFERENCES public."Customer"("ID") NOT VALID;
 4   ALTER TABLE ONLY public."Order" DROP CONSTRAINT k1;
       public          postgres    false    217    215    4642         (           2606    16692    Order k2    FK CONSTRAINT     �   ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT k2 FOREIGN KEY ("Product_id") REFERENCES public."Product"("Product_id") NOT VALID;
 4   ALTER TABLE ONLY public."Order" DROP CONSTRAINT k2;
       public          postgres    false    4644    217    216                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              4792.dat                                                                                            0000600 0004000 0002000 00000000075 14574777166 0014311 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        123445	\N	\N	\N	\N	\N	\N	\N
123456	\N	\N	\N	\N	\N	\N	\N
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                   4794.dat                                                                                            0000600 0004000 0002000 00000000043 14574777166 0014306 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        100000	123456	000002	\N	\N	\N
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             4793.dat                                                                                            0000600 0004000 0002000 00000000122 14574777166 0014303 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        000001	Banh 1	\N	\N	\N	\N
000002	Banh 2	\N	\N	\N	\N
000003	Keo 1	\N	\N	\N	\N
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                              restore.sql                                                                                         0000600 0004000 0002000 00000011525 14574777166 0015420 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE test;
--
-- Name: test; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE test WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE test OWNER TO postgres;

\connect test

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Customer" (
    "ID" character(6) NOT NULL,
    "LastName" character varying(30),
    "FirstName" character varying(30),
    address character varying(30),
    "City" character(2),
    state character(5),
    zip character varying(10),
    phone character varying(30)
);


ALTER TABLE public."Customer" OWNER TO postgres;

--
-- Name: Order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Order" (
    "ID" character(6) NOT NULL,
    "Customer_id" character(6) NOT NULL,
    "Product_id" character(6) NOT NULL,
    "PurchaseDate" date,
    "Quantity" int4multirange,
    "Total" money
);


ALTER TABLE public."Order" OWNER TO postgres;

--
-- Name: Product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Product" (
    "Product_id" character(6) NOT NULL,
    "Name" character varying(30),
    "Model" character varying(30),
    "Manufacturer" character varying(30),
    "Unitprice" money,
    inventory int4multirange
);


ALTER TABLE public."Product" OWNER TO postgres;

--
-- Data for Name: Customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Customer" ("ID", "LastName", "FirstName", address, "City", state, zip, phone) FROM stdin;
\.
COPY public."Customer" ("ID", "LastName", "FirstName", address, "City", state, zip, phone) FROM '$$PATH$$/4792.dat';

--
-- Data for Name: Order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Order" ("ID", "Customer_id", "Product_id", "PurchaseDate", "Quantity", "Total") FROM stdin;
\.
COPY public."Order" ("ID", "Customer_id", "Product_id", "PurchaseDate", "Quantity", "Total") FROM '$$PATH$$/4794.dat';

--
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Product" ("Product_id", "Name", "Model", "Manufacturer", "Unitprice", inventory) FROM stdin;
\.
COPY public."Product" ("Product_id", "Name", "Model", "Manufacturer", "Unitprice", inventory) FROM '$$PATH$$/4793.dat';

--
-- Name: Customer Customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Customer"
    ADD CONSTRAINT "Customer_pkey" PRIMARY KEY ("ID");


--
-- Name: Order Order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY ("ID");


--
-- Name: Product Product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY ("Product_id");


--
-- Name: Order k1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT k1 FOREIGN KEY ("Customer_id") REFERENCES public."Customer"("ID") NOT VALID;


--
-- Name: Order k2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT k2 FOREIGN KEY ("Product_id") REFERENCES public."Product"("Product_id") NOT VALID;


--
-- Name: TABLE "Customer"; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public."Customer" TO salesman;
GRANT SELECT ON TABLE public."Customer" TO acountant;


--
-- Name: TABLE "Order"; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public."Order" TO salesman;
GRANT SELECT,INSERT,UPDATE ON TABLE public."Order" TO acountant;


--
-- Name: TABLE "Product"; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public."Product" TO salesman;
GRANT SELECT,INSERT,UPDATE ON TABLE public."Product" TO acountant;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           