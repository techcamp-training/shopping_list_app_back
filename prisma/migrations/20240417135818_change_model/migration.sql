/*
  Warnings:

  - You are about to drop the `Status` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `genreId` to the `Goods` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Goods" DROP CONSTRAINT "Goods_statusId_fkey";

-- AlterTable
ALTER TABLE "Goods" ADD COLUMN     "genreId" INTEGER NOT NULL;

-- DropTable
DROP TABLE "Status";

-- CreateTable
CREATE TABLE "Genre" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Genre_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Goods" ADD CONSTRAINT "Goods_genreId_fkey" FOREIGN KEY ("genreId") REFERENCES "Genre"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
