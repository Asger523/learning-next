-- CreateTable
CREATE TABLE "Locations" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "region" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    "timezone" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Locations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Conditions" (
    "id" SERIAL NOT NULL,
    "text" TEXT NOT NULL,
    "icon" TEXT NOT NULL,
    "code" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Conditions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Reports" (
    "id" SERIAL NOT NULL,
    "locationId" INTEGER NOT NULL,
    "conditionId" INTEGER NOT NULL,
    "temperature" DOUBLE PRECISION NOT NULL,
    "feelsLikeTemperature" DOUBLE PRECISION NOT NULL,
    "windKph" DOUBLE PRECISION NOT NULL,
    "gustKph" DOUBLE PRECISION NOT NULL,
    "humidity" INTEGER NOT NULL,
    "uvIndex" DOUBLE PRECISION NOT NULL,
    "lastUpdatedAt" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Reports_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Locations_name_key" ON "Locations"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Conditions_code_key" ON "Conditions"("code");

-- CreateIndex
CREATE UNIQUE INDEX "Reports_locationId_lastUpdatedAt_key" ON "Reports"("locationId", "lastUpdatedAt");

-- AddForeignKey
ALTER TABLE "Reports" ADD CONSTRAINT "Reports_locationId_fkey" FOREIGN KEY ("locationId") REFERENCES "Locations"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Reports" ADD CONSTRAINT "Reports_conditionId_fkey" FOREIGN KEY ("conditionId") REFERENCES "Conditions"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
