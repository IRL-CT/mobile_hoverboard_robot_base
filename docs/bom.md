# Bill of Materials

All parts needed to build one Trashbot unit.

---

## Chassis & Frame

| Qty | Part | Source |
|-----|------|--------|
| 1 | Deconstructed Hoverboard | [Walmart](https://www.walmart.com/ip/Hover-1-Evolution-Hoverboard-for-Teens-LED-Headlights-6-mph-Max-Speed-Midnight-Blue/5516406756?wl13=3795&selectedSellerId=0&wmlspartner=wlpa) \| [eBay](https://www.ebay.com/itm/365105901136?epid=2325996449&itmmeta=01KJZPAZ5BMDTWF08022JWK26E&hash=item550201ee50:g:-kAAAOSwgwxiXudv) |
| 1 | Trash Can Dolly with Wheels (Rubbermaid BRUTE) | [Amazon](https://www.amazon.com/Rubbermaid-Commercial-Products-BRUTE-FG264000BLA/dp/B00002N8AI/) |
| 1 | Trash Bin | [Home Depot](https://www.homedepot.com/p/Rubbermaid-Commercial-Products-BRUTE-32-Gal-Grey-Vented-Plastic-Outdoor-Trash-Can-with-Lid-For-Restaurants-Offices-Warehouses-Commercial-Environments-2031188/100342585) |

---

## Drive System

| Qty | Part | Source |
|-----|------|--------|
| 1 | ODrive Motor Controller v3.6 | [ODrive Robotics](https://odriverobotics.com/shop/odrive-v36) |
| 1 | XT60 Power Cable | [Amazon](https://www.amazon.com/dp/B085HF31K7?ref_=cm_sw_r_cp_ud_dp_7PRBW66BG9RAYCXMKF54) |
| 1 | Lithium-Ion Battery (if hoverboard battery not usable) | [Amazon](https://www.amazon.com/dp/B0D1Y9V67G?ref_=cm_sw_r_cp_ud_dp_YSAE0B528CGVWM50JYBJ) |

---

## Filtering PCB (per motor)
ODrive v3.6 has some issues with hall sensors [Forum link](https://discourse.odriverobotics.com/t/how-to-move-the-hall-sensor-motor-on-odrive-3-6/13085/2). Solution involves using 22 nF capacitors to filter out the noise. Newer ODrives may not encounter this issue, but we have not tested them yet.

| Qty | Part | Source |
|-----|------|--------|
| 6 | 22 nF Capacitors | [DigiKey](https://www.digikey.com/en/products/detail/kemet/C321C223J1G5TA/6655593) |

---


## Compute & Control

| Qty | Part | Source |
|-----|------|--------|
| 2 | Raspberry Pi 4 (or newer) | [RPi4](https://www.raspberrypi.com/products/raspberry-pi-4-model-b/) |
| 2 | Power Banks | [Amazon](https://www.amazon.com/dp/B09NRG2YT3?ref_=cm_sw_r_cp_ud_dp_C01H3BF5TH4ZYA3KB7CM) |
| 1 | 8BitDo Lite 2 Bluetooth Controller | [Amazon](https://www.amazon.com/dp/B0B3DH1Z4P?ref_=cm_sw_r_cp_ud_dp_CN3N8MQRBRZYMZPRE8HT) |

---

## Fasteners & Misc.

| Qty | Part |
|-----|------|
| ~10 | Screws (for dolly and mounting plate) |
| ~8 | Nuts |
| 2 | Screwdrivers |

---

## Laser Cut Files (for trash barrel robot example)

Download the templates from the [images directory](https://github.com/IRL-CT/Summer25_Trashbot/tree/main/images):

- `trashbot_guidlines_all.ai` — full drilling template
- `trashbot_guidlines_inner.ai` — inner circular mounting plate
