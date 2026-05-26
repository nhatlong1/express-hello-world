const request = require("supertest");
const app = require("./app");

describe("App Tests", () => {
  it("should return the html homepage on GET /", async () => {
    const response = await request(app).get("/");
    expect(response.status).toBe(200);
    expect(response.type).toBe("text/html");
    expect(response.text).toContain("Phan Mai Nhật Long");
  });

  it("should return the sum of two numbers on GET /api/sum", async () => {
    const response = await request(app).get("/api/sum?a=5&b=10");
    expect(response.status).toBe(200);
    expect(response.body).toEqual({ result: 15 });
  });
});
